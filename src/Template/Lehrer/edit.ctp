<?php
/**
  * @var \App\View\AppView $this
  */
?>
<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Form->postLink(
                __('Delete'),
                ['action' => 'delete', $lehrer->id],
                ['confirm' => __('Are you sure you want to delete # {0}?', $lehrer->id)]
            )
        ?></li>
        <li><?= $this->Html->link(__('List Lehrer'), ['action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('List Arbeitsmaterialien'), ['controller' => 'Arbeitsmaterialien', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Arbeitsmaterialien'), ['controller' => 'Arbeitsmaterialien', 'action' => 'add']) ?></li>
        <li><?= $this->Html->link(__('List Klasse Fach'), ['controller' => 'KlasseFach', 'action' => 'index']) ?></li>
        <li><?= $this->Html->link(__('New Klasse Fach'), ['controller' => 'KlasseFach', 'action' => 'add']) ?></li>
    </ul>
</nav>
<div class="lehrer form large-9 medium-8 columns content">
    <?= $this->Form->create($lehrer) ?>
    <fieldset>
        <legend><?= __('Edit Lehrer') ?></legend>
        <?php
            echo $this->Form->control('vorname');
            echo $this->Form->control('nachname');
            echo $this->Form->control('telefonnummer');
            echo $this->Form->control('email');
            echo $this->Form->control('passwort');
            echo $this->Form->control('mentor');
        ?>
    </fieldset>
    <?= $this->Form->button(__('Submit')) ?>
    <?= $this->Form->end() ?>
</div>
