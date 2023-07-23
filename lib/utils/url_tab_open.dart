import 'dart:html' as html;


void UrlRedirectionNewTab(String url){
  html.window.open(
    url,
    'new tab',
  );
}