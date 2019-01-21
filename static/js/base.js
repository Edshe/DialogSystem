var questionnaire_vm = new Vue({
	el: '#questionnaires',
	delimiters: ['${', '}'],
	data: {
		questionnaire_list: null
	},
	mounted(){
		axios
		.get('/api/questionnaires/')
		.then((response) => {
			this.questionnaire_list = response.data;
		})
		.catch((error) => {console.log(error)});
	},

	methods:{
		showQuestionnaire: function(event){
			active_dialog_vm.getFirstQuestion(
					this.getFromListbyId(event.target.id)
					)
		},
		getFromListbyId: function(id){
			for (var i=0; questionnaire = this.questionnaire_list[i]; i++){
				if (questionnaire.id == id){
					return questionnaire
				}
			}
		}
	}
})




var active_dialog_vm = new Vue({
	el: '#active_questionnaire',
	delimiters: ['${', '}'],
	data: {
		config : {
			headers : {
				'X-CSRFToken':window.csrf_token
			}
		},
		last_event: null,
		questionnaire:null,
		question: {
			choices:null
		},
		dialog:null,
		answer:null
	},

	methods:{
		startDialog: function(){
				data = {
					questionnaire:this.questionnaire.id
				}
				axios.post('/api/dialogs/', data, this.config)
				.then((response) => {
					this.dialog = response.data;
					this.sendUserAnswer(this.last_event)
				})
				.catch((error) => {
					if (error.response){
						console.log(error.response.data)
					}
				});
		},
		refreshDialog: function(){
				axios.get('/api/dialogs/dialog/'+this.dialog.id+'/', {}, this.config)
				.then((response) => {
					this.dialog = response.data;
					console.log(this.dialog.to_str)
				})
				.catch((error) => {
					if (error.response){
						console.log(error.response.data)
					}
				});
		},
		getFirstQuestion: function(questionnaire){
			this.questionnaire = questionnaire;
			this.question = {};
			this.dialog = null;
			if (this.questionnaire.first_question_id){
				this.getQuestion(this.questionnaire.first_question_id)
			}else{
				this.question.text = 'Sorry, no questions yet:('
			}
		},
		getQuestion: function(question_id){
			var url = "/api/questionnaires/question/"+question_id+"/";
			axios
			.get(url)
			.then((response) => {
				console.log(response.data)
				this.question = response.data;
			})
			.catch((error) => {
				console.log(error.response.data)
			});
		},
		sendUserAnswer: function(event){
			if (this.dialog != null){
				var data = {
					dialog: this.dialog.id,
					choice: event.target.id
				}
				axios.post('/api/dialogs/useranswers/', data, this.config)
				.then((response) => {
					console.log(response.data)
					this.answer = response.data;
					this.checkChoice(event)
				})
				.catch((error) => {
					if (error.response){
						console.log(error.response.data)
					}
				});
			}else{
				this.startDialog()
				this.last_event = event
			}
		},
		checkChoice: function(event){
			choice = this.getChoicebyId(event.target.id)
			if (choice.finish){
				this.question.text = choice.finish.text;
				this.question.choices = null;
				this.refreshDialog()
				this.answer = null;

			}else{

				if (choice.next_question){
					this.getQuestion(choice.next_question)
				}
			}
		},

		getChoicebyId: function(id){
			for (var i=0; choice = this.question.choices[i]; i++){
				if (choice.id == id){
					return choice
				}
			}
		},

	}
})


var dialogs_vm = new Vue({
	el: '#dialogs_block',
	delimiters: ['${', '}'],
	data: {
		dialogs:null,
		show:false
	},

	methods:{
		getUserDialogs: function(){
			var url = "/api/dialogs/";
			axios
			.get(url)
			.then((response) => {
				this.dialogs = response.data;
				this.show = true
			})
			.catch((error) => {
				if (error.response){
					console.log(error.response)
				}
			});
		},

	}
})