Class {
	#name : #MiBusPresenter,
	#superclass : #MiMidasItemPresenter,
	#instVars : [
		'loggerButton'
	],
	#category : #'Midas-Core-Overview'
}

{ #category : #specs }
MiBusPresenter class >> defaultSpec [
	^ SpBoxLayout newHorizontal
		add: #nameLabel;
		add: SpNullPresenter new;
		add: #loggerButton expand: false;
		yourself
]

{ #category : #actions }
MiBusPresenter >> activateItem: aBrowser [
	aBrowser followBus: model
]

{ #category : #actions }
MiBusPresenter >> deactivateItem: aBrowser [
	aBrowser unfollowBus: model
]

{ #category : #initialization }
MiBusPresenter >> initializePresenters [
	super initializePresenters.
	loggerButton := self newButton
		iconName: #history;
		label: 'Open logger';
		action: [ MiLogBrowser runMeFollowing: model ]
]

{ #category : #settings }
MiBusPresenter >> toolbarLabel [
	^ model name
]
