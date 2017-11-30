import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { HttpClientModule }    from '@angular/common/http';

import { AppComponent } from './app.component';
import { UrlService } from './url.service';
import { ClipboardModule } from 'ngx-clipboard';

@NgModule({
  declarations: [AppComponent],
  imports: [BrowserModule, HttpClientModule, ClipboardModule],
  providers: [UrlService],
  bootstrap: [AppComponent]
})
export class AppModule { }
