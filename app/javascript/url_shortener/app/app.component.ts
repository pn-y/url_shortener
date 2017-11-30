import { Component, OnInit } from '@angular/core';
import templateString from './app.component.html';
import styleString from './app.component.scss';

import { UrlService } from './url.service';

@Component({
  selector: 'url-shortener',
  template: templateString,
  styles: [ styleString ]
})

export class AppComponent implements OnInit {
  constructor(private urlService: UrlService) { }

  inputKind: string = '';
  longUrl: string = '';
  shortUrl: string = '';

  ngOnInit() {
    this.inputKind = 'initial';
  }

  addLink(longUrl): void {
    if(!longUrl) {
      return console.log('Required');
    }
    this.urlService.addLink(longUrl).subscribe(
      data => this.setUrls(data)
    )
  }

  clearLink(): void {
    this.longUrl = '';
    this.shortUrl = '';
    this.inputKind = 'initial';
  }

  setUrls(data): void {
    this.longUrl = data.long_url;
    this.shortUrl = window.location.origin + '/' + data.short_url;
    this.inputKind = 'shorten';
  }
}
