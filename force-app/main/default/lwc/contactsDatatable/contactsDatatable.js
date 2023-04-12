import { LightningElement, api , wire , track} from 'lwc';
import { refreshApex } from '@salesforce/apex';
import fetchContacts from '@salesforce/apex/ContactsDatatableList.fetchContacts';
import fetchAllContacts from '@salesforce/apex/ContactsDatatableList.fetchAllContacts';

export default class ContactsDatatable extends LightningElement {
    
    @api recordId;
    @track contacts;
    @api searchkey;
    @track cachedData;
    
    error;

   
    @wire( fetchAllContacts, {accId: '$recordId'}) 
    contactRecord(response) { 
            //this.refreshTable = response;
        if (response.data) {
                this.cachedData = response.data;
                this.contacts = response.data;
            } else if (response.error){
                console.log('error : ',error);
            }
    }

    @api
    refreshData(){
        alert('in refresh method');
        alert(this.cachedData);
        this.contacts = this.cachedData;
        /*fetchAllContacts({
          accId : this.recordId
          }).then(data => {
                this.contacts = data;
                this.error = undefined;

            }).catch(error => {
                this.error = error;
                console.log("error", JSON.stringify(this.error));
            });*/
           return refreshApex(this.contacts);
    }


    @api 
    getContacts() {
      
      fetchContacts({
          accId : this.recordId, 
          SearchKeyword : this.searchkey
          }).then(data => {
                this.contacts = data;
                this.error = undefined;

            }).catch(error => {
                this.error = error;
                console.log("error", JSON.stringify(this.error));
            });
    }

}