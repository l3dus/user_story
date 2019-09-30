<?php
namespace Models;

use \Core\Model;

class Cart extends Model {

    public function getList() {
        $array = array();

        $sql = $this->db->prepare("
			SELECT 
                s.id, s.date_sale, s.status, k.name
            FROM 
                sales as s
            INNER JOIN 
                sale_items as si ON si.id_sale = s.id
            INNER JOIN
                kit as k ON k.id = si.id_kit
			");
        $sql->execute();

        if($sql->rowCount() > 0) {
            $array = $sql->fetchAll();
        }

        return $array;
    }

public function getDetail() {
    $array = array();

    $sql = $this->db->prepare("
			SELECT 
            s.total_price as price, 
            s.date_sale as date_sale,
            i.name as item, 
            i.qtd as qtd,
            c.cnpj, c.uf, c.cep, c.address, c.country, c.comment,
            u.name as usuario
            FROM 
                sales as s
            INNER JOIN 
                sale_items as si ON si.id_sale = s.id
            INNER JOIN
                kit as k ON k.id = si.id_kit
                INNER JOIN
                items as i ON i.id_kit = k.id
            INNER JOIN 
                client as c ON c.id = s.id_client
            INNER JOIN
                user as u ON u.id = s.id_user
			");
    $sql->execute();

    if($sql->rowCount() > 0) {
        $array = $sql->fetchAll();
    }

    return $array;
}

public function setLog($id, $id_user, $id_sale, $status) {
    $sql = $this->db->prepare("INSERT INTO sale_history SET id = :id, id_user = :id_user, id_sale = :id_sale, status = :status, date_action = NOW()");
    $sql->bindValue(":id", $id);
    $sql->bindValue(":id_user", $id_user);
    $sql->bindValue(":id_sale", $id_sale);
    $sql->bindValue(":status", $status);
    $sql->execute();
}

public function setStatus($id, $status) {
        $sql = $this->db->prepare("UPDATE sale SET status = :status");
		$sql->bindValue(":status", $status);
		$sql->bindValue(":id", $id);
		$sql->execute();

        $id = $this->db->lastInsertId();
		$this->setLog($id, $id_user, $status);
}

public function getStatusHistory() {
    $array = array();

    $sql = $this->db->prepare("
    SELECT 
        sh.data_set as date,
        sh.status as status
    FROM
        status_history as sh
    INNER JOIN 
        sales as s ON s.id = sh.id_sale
    ORDER BY sh.data_set desc
        ");
    $sql->execute();

    if($sql->rowCount() > 0) {
        $array = $sql->fetchAll();
    }

    return $array;
}




}











