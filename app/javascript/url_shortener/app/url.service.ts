import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';

import { Observable } from 'rxjs/Observable';
import { of } from 'rxjs/observable/of';
import { catchError, map, tap } from 'rxjs/operators';

const httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'application/json' })
};

@Injectable()
export class UrlService {

  constructor(private http: HttpClient) { }

  private linksUrl = 'api/v1/links';

  private shortenUrl(): string {
    let alphabet = 'abcdefghijkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ023456789';
    let shortUrl = '';
    Array(6).fill(1).map(function() {
      shortUrl += alphabet.charAt(Math.floor(Math.random() * alphabet.length))
    });
    return shortUrl;
  }

  addLink(longUrl): Observable<any> {
    const body = { long_url: longUrl, short_url: this.shortenUrl() };
    return this.http.post(this.linksUrl, body, httpOptions)
      .pipe(
        catchError(this.handleError<any>('addLink'))
      );
  }

  private handleError<T> (operation = 'operation', result?: T) {
    return (error: any): Observable<T> => {

      console.log(error);
      console.log(`${operation} failed: ${error.message}`);
      return of(result as T);
    };
  }
}
