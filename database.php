<?php

if (!defined('UNDER_INDEX')) {
    header('Location: /');
}

class Database {

    private $connection;

    public function connect($host, $port, $username, $password, $dbname) {
        if ($this->isConnected()) {
            return true;
        }

        $dsn = "pgsql:host=$host;port=$port;dbname=$dbname";

        try {
            $this->connection = new PDO($dsn, $username, $password);
        } catch (PDOException $e) {
            throw new Exception('Connection failed ('.$e->getMessage().')');
        }

        return true;
    }

    public function isConnected() {
        return isset($this->connection);
    }

    public function beginTransaction() {
        if (!$this->isConnected()) {
            return false;
        }
        return $this->connection->beginTransaction();
    }

    public function commit() {
        if (!$this->isConnected()) {
            return false;
        }
        return $this->connection->commit();
    }

    public function rollback() {
        if (!$this->isConnected()) {
            return false;
        }
        return $this->connection->rollback();
    }

    public function execute($sql, $parameters=array()) {
        if (!$this->isConnected()) {
            return false;
        }

        $statement = $this->connection->prepare($sql);

        foreach ($parameters as $key => $value) {
            $statement->bindValue(":$key", $value);
        }

        if ($statement->execute()) {
            $result = $statement->fetchAll(PDO::FETCH_ASSOC);
            $statement->closeCursor();
            return $result;
        } else {
            $error = $statement->errorInfo();
            $statement->closeCursor();
            $backtrace = debug_backtrace();
            throw new Exception($error[2].', file: '.$backtrace[0]['file'].' on line '.$backtrace[0]['line'], E_USER_ERROR);
        }
    }

    public function disconect() {
        $this->connection = null;
    }

}

?>