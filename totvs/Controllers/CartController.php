<?php
namespace Controllers;

use \Core\Controller;
use \Models\Cart;

class CartController extends Controller {

    public function __construct() {
        parent::__construct();

    }

    public function index() {
        $data = array();

        $data['statuses'] = array(
            '0'=>'ABERTO',
            '1'=>'FATURADO',
            '2'=>'CANCELADO'
        );

            $c = new Cart();

            $data['list'] = $c->getList();
            $data['details'] = $c->getDetail();
            $data['history'] = $c->getStatusHistory();

            $this->loadTemplate("cart", $data);


    }



}




