
<nav aria-label="breadcrumb" style="padding-top: 12px">
    <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="<?php echo BASE_URL; ?>">Home</a></li>
        <li class="breadcrumb-item active" aria-current="page">Pedidos</li>
    </ol>
</nav>

<div class="shadow-sm mb-5">
    <div class="card">
        <div class="card-header">
            Lista de pedidos
        </div>
        <div class="card-body">
            <h5 class="card-title">Visão geral</h5>





            <div class="accordion" id="accordionExample">
                <?php foreach($list as $l): ?>
                <div class="card">
                    <div class="card-header" id="headingOne">
                        <h5 class="mb-0">
                            <button class="btn btn-link " type="button"  data-toggle="collapse" data-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                <strong>
                                    <?php echo "Pedido ".$l['id']." - ".$l['name']. " - " .$statuses[$l['status']]. " - ". date('d-m-Y', strtotime($l['date_sale'])); ?>
                                </strong>
                            </button>
                        </h5>
                    </div>

                    <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                        <div class="card-body">

                            <div class="card">
                                <div class="card-header">
                                    <strong>
                                        <i class="fas fa-bars" style="padding-right: 10px"></i>Pedido #<?php echo $l['id']; ?> Detalhes
                                    </strong>
                                </div>
                                <div class="card-body">

                                    <div class="card">
                                        <div class="card-header" style="background: #98FB98; color: #008000">
                                            <strong>
                                                <div class="row">
                                                    <div class="col-lg-11">
                                                        <?php echo $l['name']; ?>
                                                    </div>
                                                    <div class="col-lg-1">
                                                        x1
                                                    </div>
                                                </div>
                                            </strong>
                                        </div>
                                        <?php foreach($details as $d): ?>
                                        <div class="card">
                                            <div class="card-body">
                                               <div class="row">
                                                   <div class="col-lg-11">
                                                       <?php echo $d['item']; ?>
                                                   </div>
                                                   <div class="col-lg-1">
                                                       <strong><?php echo "x". $d['qtd']; ?></strong>
                                                   </div>
                                               </div>
                                            </div>
                                        </div>
                                        <?php endforeach; ?>

                                    </div>

<br>
                                    <table class="table">
                                        <tbody>
                                        <tr>
                                            <td>Contrato de licença:</td>
                                            <td>@</td>
                                        </tr>
                                        <tr>
                                            <td>Status</td>
                                            <td><span class="badge badge-warning"><?php echo $statuses[$l['status']] ?></span></td>
                                        </tr>
                                        <tr>
                                            <td>Preço</td>
                                            <td><?php echo "R$ ".number_format($d['price'],2); ?></td>
                                        </tr>
                                        <tr>
                                            <td>Data de criação</td>
                                            <td><?php echo date('d/m/Y', strtotime($d['date_sale'])); ?></td>
                                        </tr>
                                        <tr>
                                            <td>CNPJ para envio</td>
                                            <td><?php echo $d['cnpj']; ?></td>
                                        </tr>
                                        <tr>
                                            <td>Estado para envio</td>
                                            <td><?php echo $d['uf']; ?></td>
                                        </tr>
                                        <tr>
                                            <td>CEP para envio</td>
                                            <td><?php echo $d['cep']; ?></td>
                                        </tr>
                                        <tr>
                                            <td>Endereço para envio</td>
                                            <td><?php echo $d['address']; ?></td>
                                        </tr>
                                        <tr>
                                            <td>País para envio</td>
                                            <td><?php echo $d['country']; ?></td>
                                        </tr>
                                        <tr>
                                            <td>Comentário do pedido</td>
                                            <td><?php echo $d['comment']; ?></td>
                                        </tr>
                                        <tr>
                                            <td>Executivo de vendas</td>
                                            <td><?php echo $d['usuario']; ?></td>
                                        </tr>
                                        </tbody>
                                    </table></br>
                                    <h6>Histórico de pedidos</h6>
                                    <table class="table">
                                    
                                        <tbody>
                                        <?php foreach($history as $h): ?>
                                            <tr>
                                                <td><?php echo $h['date'];?></td>
                                                <td><?php echo $statuses[$h['status']] ?></td>
                                            </tr>
                                        <?php endforeach; ?>
                                        </tbody>
                                    
                                    </table>

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <?php endforeach; ?>

            </div>

        </div>
    </div>
</div>

