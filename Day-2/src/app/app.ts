import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';




@Component({
  selector: 'app-root',
  standalone : true ,
  imports: [
    CommonModule,   // 🧩 This enables structural directives like *ngIf and *ngFor
    FormsModule     // Enables ngForm and ngModel for two-way binding
  ],

  templateUrl: './app.html',
  styleUrl: './app.css'
})

export class AppComponent {
   title = 'Demo';

  formData = {
    name: '',
    age: '',
    email: ''
  };
  submitted = false;

  submitForm(form: any) {
    if (form.valid) {
      this.formData = { ...form.value };
      this.submitted = true;
    }
  }
}
