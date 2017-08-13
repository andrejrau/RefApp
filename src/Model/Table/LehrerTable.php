<?php
namespace App\Model\Table;

use Cake\ORM\Query;
use Cake\ORM\RulesChecker;
use Cake\ORM\Table;
use Cake\Validation\Validator;

/**
 * Lehrer Model
 *
 * @property \App\Model\Table\ArbeitsmaterialienTable|\Cake\ORM\Association\HasMany $Arbeitsmaterialien
 * @property \App\Model\Table\KlasseFachTable|\Cake\ORM\Association\HasMany $KlasseFach
 *
 * @method \App\Model\Entity\Lehrer get($primaryKey, $options = [])
 * @method \App\Model\Entity\Lehrer newEntity($data = null, array $options = [])
 * @method \App\Model\Entity\Lehrer[] newEntities(array $data, array $options = [])
 * @method \App\Model\Entity\Lehrer|bool save(\Cake\Datasource\EntityInterface $entity, $options = [])
 * @method \App\Model\Entity\Lehrer patchEntity(\Cake\Datasource\EntityInterface $entity, array $data, array $options = [])
 * @method \App\Model\Entity\Lehrer[] patchEntities($entities, array $data, array $options = [])
 * @method \App\Model\Entity\Lehrer findOrCreate($search, callable $callback = null, $options = [])
 *
 * @mixin \Cake\ORM\Behavior\TimestampBehavior
 */
class LehrerTable extends Table
{

    /**
     * Initialize method
     *
     * @param array $config The configuration for the Table.
     * @return void
     */
    public function initialize(array $config)
    {
        parent::initialize($config);

        $this->setTable('lehrer');
        $this->setEntityClass('App\Model\Entity\Lehrer');
        $this->setDisplayField('id');
        $this->setPrimaryKey('id');

        $this->addBehavior('Timestamp');

        $this->hasMany('Arbeitsmaterialien', [
            'foreignKey' => 'lehrer_id'
        ]);
        $this->hasMany('KlasseFach', [
            'foreignKey' => 'lehrer_id'
        ]);
    }

    /**
     * Default validation rules.
     *
     * @param \Cake\Validation\Validator $validator Validator instance.
     * @return \Cake\Validation\Validator
     */
    public function validationDefault(Validator $validator)
    {
        $validator
            ->integer('id')
            ->allowEmpty('id', 'create');

        $validator
            ->requirePresence('vorname', 'create')
            ->notEmpty('vorname');

        $validator
            ->requirePresence('nachname', 'create')
            ->notEmpty('nachname');

        $validator
            ->requirePresence('telefonnummer', 'create')
            ->notEmpty('telefonnummer');

        $validator
            ->email('email')
            ->requirePresence('email', 'create')
            ->notEmpty('email');

        $validator
            ->requirePresence('passwort', 'create')
            ->notEmpty('passwort');

        $validator
            ->boolean('mentor')
            ->requirePresence('mentor', 'create')
            ->notEmpty('mentor');

        return $validator;
    }

    /**
     * Returns a rules checker object that will be used for validating
     * application integrity.
     *
     * @param \Cake\ORM\RulesChecker $rules The rules object to be modified.
     * @return \Cake\ORM\RulesChecker
     */
    public function buildRules(RulesChecker $rules)
    {
        $rules->add($rules->isUnique(['email']));

        return $rules;
    }
}
