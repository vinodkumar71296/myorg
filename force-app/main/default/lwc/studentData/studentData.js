import { LightningElement, track } from "lwc";

export default class StudentData extends LightningElement {
  @track name;
  @track age;
  @track rollNumber;
  @track dateOfBirth;
  @track tableData = [];
  @track nextId = 1;

  @track isVisible = false;

  @track errorMessage;

  handleInputChange(event) {
    const fieldName = event.target.name;
    const value = event.target.value;
    this[fieldName] = value;
  }

  handleAddButtonClick() {
    if (!this.name || !this.age || !this.rollNumber || !this.dateOfBirth) {
      this.errorMessage = "Please enter all fields";
      return;
    }
    this.isVisible = true;
    const newRow = {
      id: this.nextId++,
      name: this.name,
      age: this.age,
      rollNumber: this.rollNumber,
      dateOfBirth: this.dateOfBirth
    };
    this.tableData = [...this.tableData, newRow];
    this.name = "";
    this.age = "";
    this.rollNumber = "";
    this.dateOfBirth = "";
  }

  handleDeleteButtonClick(event) {
    const rowId = event.target.dataset.rowId;
    this.tableData = this.tableData.filter((row) => row.id != rowId);

    if (this.tableData.length === 0) {
      this.isVisible = false;
    }
  }

  setError(message) {
    this.errorMessage = message;
  }
}