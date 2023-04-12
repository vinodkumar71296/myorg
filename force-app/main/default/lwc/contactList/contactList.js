import { LightningElement, api, track, wire } from "lwc";
import { encodeDefaultFieldValues } from 'lightning/pageReferenceUtils';
import { ShowToastEvent } from "lightning/platformShowToastEvent";
import { deleteRecord } from "lightning/uiRecordApi";
import { NavigationMixin } from "lightning/navigation";
import { refreshApex } from '@salesforce/apex';
import fetchAllContacts from "@salesforce/apex/ContactsDatatableList.fetchAllContacts";

export default class ContactList extends NavigationMixin(LightningElement) {
  @api recordId;
  @track contacts;
  @track editDetailRecordId;
  @track deleteDetailRecordId;
  @track error;
  @track contactsCount;
  @track showRecordForm;

  @wire(fetchAllContacts, { accId: "$recordId" })
  contactRecord(response) {
     this.dataToRefresh = response;
    if (response.data) {
      this.contacts = response.data;
      this.contactsCount = Object.keys(this.contacts).length;
      // alert(this.contactsCount);
    } else if (response.error) {
      console.log((this.error = error));
    }
  }

  callWindowLocation(){
    window.location = "/lightning/r/Account/"+this.recordId+"/view";
  }

  
  createRecord() {
    const defaultValues = encodeDefaultFieldValues({
      AccountId: this.recordId
    });

      this[NavigationMixin.Navigate]({
        type: "standard__objectPage",
        attributes: {
          objectApiName: "Contact",
          actionName: "new"
        },
        state: {
          defaultFieldValues: defaultValues
        }
      })
        //  this[NavigationMixin.Navigate]({
        //   type: "standard__recordPage",
        //   attributes: {
        // 	objectApiName: "Account",
        // 	actionName: "view",
        // 	recordId: this.recordId
        //   }
        // });
        return refreshApex(this.dataToRefresh);
        setTimeout(this.callWindowLocation.bind(this), 800);
  }

  redirecttoAccount(){
    setTimeout(this.callWindowLocation.bind(this), 800);
  }

  navigateToContactHome() {
    this[NavigationMixin.Navigate]({
            type: "standard__recordRelationshipPage",
            attributes: {
                recordId: this.recordId,
                relationshipApiName: "Contacts",
                actionName: "view",
                objectApiName: "Contact"
            }
        });
  }

  closeModal() {
      this.showRecordForm = false;        
  }

  // handleSuccess(event){
  //       this.dispatchEvent(
  //           new ShowToastEvent({
  //               title: 'Success',
  //               message: 'Record was saved successfully.',
  //               variant: 'success'
  //           })
  //       );
  //       setTimeout(this.callWindowLocation.bind(this), 800);
  //   }

  handleEdit(event) {
    alert('In the edit method');
    this.editDetailRecordId = event.target.dataset.id;
    // alert(this.editDetailRecordId);
    this.showRecordForm = true; 

    // this[NavigationMixin.Navigate]({
    //   type: "standard__objectPage",
    //   attributes: {
    //     objectApiName: "Contact",
    //     recordId: this.editDetailRecordId,
    //     actionName: "edit"
    //   }
    // });
  }

  handleNavigate(event) {
    
    let recId = event.target.dataset.id;

    this[NavigationMixin.GenerateUrl]({
        type: "standard__recordPage",
        attributes: {
            objectApiName: "Contact",
            recordId: recId,
            actionName: "view"
        }
    }).then(generatedUrl => {
        window.open(generatedUrl, "_blank");
    });
  }

  handleDelete(event) {
    this.deleteDetailRecordId = event.target.dataset.id;

    deleteRecord(this.deleteDetailRecordId)
      .then(() => {
        this.dispatchEvent(
          new ShowToastEvent({
            title: "Success",
            message: "Contact has been deleted",
            variant: "success"
          })
        );

        this[NavigationMixin.Navigate]({
          type: "standard__objectPage",
          attributes: {
            objectApiName: "Account",
            actionName: "home"
          }
        });
         return refreshApex(this.dataToRefresh);
      // setTimeout(this.callWindowLocation.bind(this), 800);
      })
      .catch((error) => {
        this.dispatchEvent(
          new ShowToastEvent({
            title: "Error while deleting record",
            message: error.body.message,
            variant: "error"
          })
        );
      });
  }
}