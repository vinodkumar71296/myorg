import { LightningElement,track } from 'lwc';
export default class ParentLWC extends LightningElement {


    @track param1;
    @track param2;

    handleName(event){
       if(event.target.name == 'name'){
           this.param1 = event.detail.value;
       }
    }

    handleAge(event){
       if(event.target.name == 'age'){
           this.param2 = event.detail.value;
       }
    }

    callChildMethod(){
        let child = this.template.querySelector('c-child-l-w-c');
        child.handleChange(this.param1, this.param2);
    }

}