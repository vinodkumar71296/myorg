import { LightningElement,track,wire} from 'lwc';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { createRecord } from "lightning/uiRecordApi";
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import WEBSITE_FIELD from '@salesforce/schema/Account.Website';
//import insertAccounts from '@salesforce/apex/CreateAccounts.insertAccounts';

export default class createAccount extends LightningElement {
    @track customFormModal = false;
    @track isLoading = false;

    message;
    error;

    name;
    phone;
    industry;
    website;

    @wire(getObjectInfo, { objectApiName: ACCOUNT_OBJECT })
    accountMetadata;
 
    // retriving the Industry picklist values of Account
 
    @wire(getPicklistValues,
        {
            recordTypeId: '$accountMetadata.data.defaultRecordTypeId', 
            fieldApiName: INDUSTRY_FIELD
        }
    ) IndustryPicklist;

  
    customShowModalPopup() {
                    
        this.customFormModal = true;
    }
 
    customHideModalPopup() {    
        
        this.customFormModal = false;
    }
    
   
    callMe(event){
        const evtname = event.target.name;

        if(evtname == 'nameval')
        {
            this.name = event.target.value != null ?event.target.value:null;
        }
        else if (evtname == 'phoneval')
        {
            this.phone = event.target.value != null ?event.target.value:null;
        }
        else if (evtname == 'industryval')
        {
            this.industry = event.target.value != null ?event.target.value:null;
        }
        else
        {
            this.website = event.target.value != null ?event.target.value:null;
        }

    }
    // Creating account using client side
    createAccount() {
    this.isLoading = true;
    // Map the data to the fields
    const fields = {};

    fields[NAME_FIELD.fieldApiName] = this.name;
    fields[PHONE_FIELD.fieldApiName] = this.phone;
    fields[INDUSTRY_FIELD.fieldApiName] = this.industry;
    fields[WEBSITE_FIELD.fieldApiName] = this.website;
        
        // Prepare config object with object and field API names 
    const recordInput = {
      apiName: ACCOUNT_OBJECT.objectApiName,
      fields: fields
    };
        
        // Invoke createRecord by passing the config object
    createRecord(recordInput).then((record) => {
                this.message = record;
                this.error = undefined;
                this.isLoading = false;
                this.customFormModal = false;
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: `Account created with id ${record.id} sucessfully...!!`,
                        variant: 'success',
                    }),
                );
            }).catch(error => {
                this.message = undefined;
                this.error = error;
                this.isLoading = false;
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Oops!! record creation failed...',
                        message: error.body.message,
                        variant: 'error',
                    }),
                );
                console.log("error", JSON.stringify(this.error));
            });
    }

    // Creating account using server side
    /*createAccount() {
        this.isLoading = true;
      insertAccounts({
            Name: this.name,
            Phone: this.phone,
            Industry: this.industry,
            Website: this.website
        }).then(result => {
                this.message = result;
                this.error = undefined;
                this.isLoading = false;
                this.customFormModal = false;
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Success',
                        message: 'Account created sucessfully...!!',
                        variant: 'success',
                    }),
                );
            }).catch(error => {
                this.message = undefined;
                this.error = error;
                this.isLoading = false;
                this.dispatchEvent(
                    new ShowToastEvent({
                        title: 'Oops!! record creation failed...',
                        message: error.body.message,
                        variant: 'error',
                    }),
                );
                console.log("error", JSON.stringify(this.error));
            });
    }*/
    
}