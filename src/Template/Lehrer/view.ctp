<?php
/**
  * @var \App\View\AppView $this
  * @var \App\Model\Entity\Lehrer $lehrer
  */
?>
<nav class="large-3 medium-4 columns" id="actions-sidebar">
    <ul class="side-nav">
        <li class="heading"><?= __('Actions') ?></li>
        <li><?= $this->Html->link(__('Edit Lehrer'), ['action' => 'edit', $lehrer->id]) ?> </li>
        <li><?= $this->Form->postLink(__('Delete Lehrer'), ['action' => 'delete', $lehrer->id], ['confirm' => __('Are you sure you want to delete # {0}?', $lehrer->id)]) ?> </li>
        <li><?= $this->Html->link(__('List Lehrer'), ['action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Lehrer'), ['action' => 'add']) ?> </li>
        <li><?= $this->Html->link(__('List Arbeitsmaterialien'), ['controller' => 'Arbeitsmaterialien', 'action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Arbeitsmaterialien'), ['controller' => 'Arbeitsmaterialien', 'action' => 'add']) ?> </li>
        <li><?= $this->Html->link(__('List Klasse Fach'), ['controller' => 'KlasseFach', 'action' => 'index']) ?> </li>
        <li><?= $this->Html->link(__('New Klasse Fach'), ['controller' => 'KlasseFach', 'action' => 'add']) ?> </li>
    </ul>
</nav>
<div class="lehrer view large-9 medium-8 columns content">
    <h3><?= h($lehrer->id) ?></h3>
    <table class="vertical-table">
        <tr>
            <th scope="row"><?= __('Vorname') ?></th>
            <td><?= h($lehrer->vorname) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Nachname') ?></th>
            <td><?= h($lehrer->nachname) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Telefonnummer') ?></th>
            <td><?= h($lehrer->telefonnummer) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Email') ?></th>
            <td><?= h($lehrer->email) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Id') ?></th>
            <td><?= $this->Number->format($lehrer->id) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Created') ?></th>
            <td><?= h($lehrer->created) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Modified') ?></th>
            <td><?= h($lehrer->modified) ?></td>
        </tr>
        <tr>
            <th scope="row"><?= __('Mentor') ?></th>
            <td><?= $lehrer->mentor ? __('Yes') : __('No'); ?></td>
        </tr>
    </table>
    <div class="related">
        <h4><?= __('Related Arbeitsmaterialien') ?></h4>
        <?php if (!empty($lehrer->arbeitsmaterialien)): ?>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <th scope="col"><?= __('Id') ?></th>
                <th scope="col"><?= __('Name') ?></th>
                <th scope="col"><?= __('Link') ?></th>
                <th scope="col"><?= __('Klasse Fach Id') ?></th>
                <th scope="col"><?= __('Schule Id') ?></th>
                <th scope="col"><?= __('Lehrer Id') ?></th>
                <th scope="col" class="actions"><?= __('Actions') ?></th>
            </tr>
            <?php foreach ($lehrer->arbeitsmaterialien as $arbeitsmaterialien): ?>
            <tr>
                <td><?= h($arbeitsmaterialien->id) ?></td>
                <td><?= h($arbeitsmaterialien->name) ?></td>
                <td><?= h($arbeitsmaterialien->link) ?></td>
                <td><?= h($arbeitsmaterialien->klasse_fach_id) ?></td>
                <td><?= h($arbeitsmaterialien->schule_id) ?></td>
                <td><?= h($arbeitsmaterialien->lehrer_id) ?></td>
                <td class="actions">
                    <?= $this->Html->link(__('View'), ['controller' => 'Arbeitsmaterialien', 'action' => 'view', $arbeitsmaterialien->id]) ?>
                    <?= $this->Html->link(__('Edit'), ['controller' => 'Arbeitsmaterialien', 'action' => 'edit', $arbeitsmaterialien->id]) ?>
                    <?= $this->Form->postLink(__('Delete'), ['controller' => 'Arbeitsmaterialien', 'action' => 'delete', $arbeitsmaterialien->id], ['confirm' => __('Are you sure you want to delete # {0}?', $arbeitsmaterialien->id)]) ?>
                </td>
            </tr>
            <?php endforeach; ?>
        </table>
        <?php endif; ?>
    </div>
    <div class="related">
        <h4><?= __('Related Klasse Fach') ?></h4>
        <?php if (!empty($lehrer->klasse_fach)): ?>
        <table cellpadding="0" cellspacing="0">
            <tr>
                <th scope="col"><?= __('Id') ?></th>
                <th scope="col"><?= __('Klasse Id') ?></th>
                <th scope="col"><?= __('Fach Id') ?></th>
                <th scope="col"><?= __('Lehrer Id') ?></th>
                <th scope="col" class="actions"><?= __('Actions') ?></th>
            </tr>
            <?php foreach ($lehrer->klasse_fach as $klasseFach): ?>
            <tr>
                <td><?= h($klasseFach->id) ?></td>
                <td><?= h($klasseFach->klasse_id) ?></td>
                <td><?= h($klasseFach->fach_id) ?></td>
                <td><?= h($klasseFach->lehrer_id) ?></td>
                <td class="actions">
                    <?= $this->Html->link(__('View'), ['controller' => 'KlasseFach', 'action' => 'view', $klasseFach->id]) ?>
                    <?= $this->Html->link(__('Edit'), ['controller' => 'KlasseFach', 'action' => 'edit', $klasseFach->id]) ?>
                    <?= $this->Form->postLink(__('Delete'), ['controller' => 'KlasseFach', 'action' => 'delete', $klasseFach->id], ['confirm' => __('Are you sure you want to delete # {0}?', $klasseFach->id)]) ?>
                </td>
            </tr>
            <?php endforeach; ?>
        </table>
        <?php endif; ?>
    </div>
</div>
