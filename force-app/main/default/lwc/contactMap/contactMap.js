import { LightningElement, wire, api, track } from "lwc";
import getContactsByAccountId from "@salesforce/apex/ContactDataMap.getContactsByAccountId";

export default class ContactMap extends LightningElement {
  @api recordId;
  @track name;
  

  @wire(getContactsByAccountId, { accId: "$recordId" })
  wiredContacts({ error, data }) {
    if (data) {
      this.handleContactsMapUpdate(data);
    } else if (error) {
      console.error(error);
    }
  }

  mapMarkers = [];

  handleContactsMapUpdate(contacts) {
    this.mapMarkers = contacts.map((contact) => {
      const Latitude = contact.MailingLatitude;
      const Longitude = contact.MailingLongitude;
      return {
        location: { Latitude, Longitude },
        title: contact.Name,
        description: `Coords: ${Latitude}, ${Longitude}`
      };
    });
  }
}