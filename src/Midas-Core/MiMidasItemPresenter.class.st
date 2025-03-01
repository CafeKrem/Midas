Class {
	#name : #MiMidasItemPresenter,
	#superclass : #MiPresenter,
	#instVars : [
		'model',
		'nameLabel'
	],
	#category : #'Midas-Core-Overview'
}

{ #category : #actions }
MiMidasItemPresenter >> activateItem: aBusOrBrowser [
	self subclassResponsibility
]

{ #category : #actions }
MiMidasItemPresenter >> deactivateItem: aBusOrBrowser [
	self subclassResponsibility
]

{ #category : #initialization }
MiMidasItemPresenter >> initializePresenters [
	super initializePresenters.
	nameLabel := self newLabel label: self toolbarLabel
]

{ #category : #'accessing model' }
MiMidasItemPresenter >> setModelBeforeInitialization: aBusOrBrowser [
	model := aBusOrBrowser
]

{ #category : #settings }
MiMidasItemPresenter >> toolbarLabel [
	^ self subclassResponsibility
]
