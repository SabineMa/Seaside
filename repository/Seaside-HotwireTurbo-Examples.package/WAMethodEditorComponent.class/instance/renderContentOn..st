accessing
renderContentOn: html

	| method methodSource |
	method := block value.
	methodSource := method ifNil:[ '' ] ifNotNil:[ method sourceCode ].
	(html tag: 'code-input')
			attributeAt: 'placeholder' put: self class sourceCodeTemplate;
			attributeAt: 'onchange' put: (html jQuery ajax callback: [ :source | methodSource := source ] value: (JSStream on: 'this.value'));
			attributeAt: 'language' put: 'Smalltalk';
			style: 'height: 400px; width: 100%';
			with: methodSource.

	html anchor
			class: 'btn elevated';
			callback: [ self saveMethodWith: methodSource ];
			with: 'Save'.