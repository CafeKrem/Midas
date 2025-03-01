"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	model:		<Object>
	properties:		<Object>


    Implementation Points
"
Class {
	#name : #MiNavigationBrowser,
	#superclass : #StPresenter,
	#instVars : [
		'navigation',
		'model',
		'activationBlock',
		'activateOnSingleClick'
	],
	#category : #'Midas-NewTools-Inspector tabs'
}

{ #category : #specs }
MiNavigationBrowser class >> buildCommandsGroupWith: presenter forRoot: aCmCommandsGroup [
	aCmCommandsGroup
		beDisplayedAsGroup;
		register: (StInspectorInspectSelectedCommand forSpecContext: presenter)
]

{ #category : #specs }
MiNavigationBrowser class >> defaultSpec [
	^ SpBoxLayout newVertical
		add: #navigation
]

{ #category : #initialization }
MiNavigationBrowser >> activateOnSingleClick [
	navigation activateOnSingleClick
]

{ #category : #accessing }
MiNavigationBrowser >> activateOnSingleClick: anObject [

	activateOnSingleClick := anObject
]

{ #category : #initialization }
MiNavigationBrowser >> hasOutputActivationPort [

	^ true
]

{ #category : #initialization }
MiNavigationBrowser >> initializePresenters [

	navigation := self newTable.

	navigation
		contextMenu: [ self rootCommandsGroup asMenuPresenter ];
		items: (self itemsFor: self model);
		sortingBlock: [ :a :b | a key asString < b key asString ].
	navigation addColumn: (SpCompositeTableColumn new
			 addColumn: (SpImageTableColumn new
					  beNotExpandable;
					  evaluated: [ :el | el value midasIcon ];
					  yourself);
			 addColumn: (SpStringTableColumn new
					  evaluated: [ :el | el key printString ];
					  yourself);
			 yourself).
	navigation whenActivatedDo: [ :selection | activationBlock value: self ].
]

{ #category : #initialization }
MiNavigationBrowser >> itemsFor: anEntity [
	^ (anEntity mooseDescription allComplexProperties
		collect: [ :property | property name -> (anEntity propertyNamed: property name) ]
		thenReject: [ :assoc | assoc value isNil or: [ assoc value isCollection and: [ assoc value isEmpty ] ] ]) 
]

{ #category : #accessing }
MiNavigationBrowser >> model [
	^ model
]

{ #category : #accessing }
MiNavigationBrowser >> model: anObject [
	model := anObject
]

{ #category : #initialization }
MiNavigationBrowser >> outputActivationPort [
	^ (SpActivationPort newPresenter: self)
		yourself
]

{ #category : #accessing }
MiNavigationBrowser >> selectedItem [
	^ navigation selection selectedItem value
]

{ #category : #initialization }
MiNavigationBrowser >> selectedObject [
	^ navigation selection selectedItem value
]

{ #category : #accessing }
MiNavigationBrowser >> setModelBeforeInitialization: anInspectionModel [ 

	model := anInspectionModel
]

{ #category : #initialization }
MiNavigationBrowser >> whenActivatedDo: aBlock [
	activationBlock := aBlock
]
