import { LightningElement,api,track } from 'lwc';
export default class ContactsDatatablesearch extends LightningElement {

    @track searchvalue;
    @api recordId;

    handleChange(event){
        const evtname = event.target.name;
        if(evtname == 'keyword'){
            this.searchvalue = event.target.value;
        }
    }

    handleSearch(){
        this.template.querySelector('c-contacts-datatable').getContacts();
    }

    handleRefresh(){
        this.searchvalue = null;
        this.template.querySelector('c-contacts-datatable').refreshData();
    }
}