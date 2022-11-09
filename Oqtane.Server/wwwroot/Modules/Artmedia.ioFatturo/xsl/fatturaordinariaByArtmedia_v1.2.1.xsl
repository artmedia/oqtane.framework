<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
	version="1.1"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:a="http://ivaservizi.agenziaentrate.gov.it/docs/xsd/fatture/v1.2">

  <xsl:output method="html" encoding="utf-8" indent="yes" />

  <xsl:template name="FormatDate">
    <xsl:param name="DateTime" />

    <xsl:variable name="year" select="substring($DateTime,1,4)" />
    <xsl:variable name="month" select="substring($DateTime,6,2)" />
    <xsl:variable name="day" select="substring($DateTime,9,2)" />

    <xsl:value-of select="' ('" />
    <xsl:value-of select="$day" />
    <xsl:value-of select="' '" />
    <xsl:choose>
      <xsl:when test="$month = '1' or $month = '01'">
        Gennaio
      </xsl:when>
      <xsl:when test="$month = '2' or $month = '02'">
        Febbraio
      </xsl:when>
      <xsl:when test="$month = '3' or $month = '03'">
        Marzo
      </xsl:when>
      <xsl:when test="$month = '4' or $month = '04'">
        Aprile
      </xsl:when>
      <xsl:when test="$month = '5' or $month = '05'">
        Maggio
      </xsl:when>
      <xsl:when test="$month = '6' or $month = '06'">
        Giugno
      </xsl:when>
      <xsl:when test="$month = '7' or $month = '07'">
        Luglio
      </xsl:when>
      <xsl:when test="$month = '8' or $month = '08'">
        Agosto
      </xsl:when>
      <xsl:when test="$month = '9' or $month = '09'">
        Settembre
      </xsl:when>
      <xsl:when test="$month = '10'">
        Ottobre
      </xsl:when>
      <xsl:when test="$month = '11'">
        Novembre
      </xsl:when>
      <xsl:when test="$month = '12'">
        Dicembre
      </xsl:when>
      <xsl:otherwise>
        Mese non riconosciuto
      </xsl:otherwise>
    </xsl:choose>
    <xsl:value-of select="' '" />
    <xsl:value-of select="$year" />

    <xsl:variable name="time" select="substring($DateTime,12)" />
    <xsl:if test="$time != ''">
      <xsl:variable name="hh" select="substring($time,1,2)" />
      <xsl:variable name="mm" select="substring($time,4,2)" />
      <xsl:variable name="ss" select="substring($time,7,2)" />

      <xsl:value-of select="' '" />
      <xsl:value-of select="$hh" />
      <xsl:value-of select="':'" />
      <xsl:value-of select="$mm" />
      <xsl:value-of select="':'" />
      <xsl:value-of select="$ss" />
    </xsl:if>
    <xsl:value-of select="')'" />
  </xsl:template>

  <xsl:template match="/">

    <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" 
				integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
			<xsl:value-of select="''"/>
        </link>
     -->

    <!--
    <link rel="stylesheet" href="http://www.iofatturo.it/DesktopModules/ArtmediaIOFatturo/css/bootstrap337CustomForXSLT.min.css">
      <xsl:value-of select="''"/>
    </link>
    
    <link rel="stylesheet" href="http://www.iofatturo.it/DesktopModules/ArtmediaIOFatturo/css/BootstrapV3/bootstrap-modal-bs3patch.css">
      <xsl:value-of select="''"/>
    </link>

    <link rel="stylesheet" href="http://www.iofatturo.it/DesktopModules/ArtmediaIOFatturo/css/BootstrapV3/bootstrap-modal.css">
      <xsl:value-of select="''"/>
    </link>
-->

    <meta charset="utf-8" />

    <style type="text/css">


      /*!
      * CUSTOM SOLO PANELS + TABLES */

      /*!
      * Generated using the Bootstrap Customizer (https://getbootstrap.com/docs/3.4/customize/)
      */
      /*!
      * Bootstrap v3.4.1 (https://getbootstrap.com/)
      * Copyright 2011-2019 Twitter, Inc.
      * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
      */
      /*! normalize.css v3.0.3 | MIT License | github.com/necolas/normalize.css */
      html {
      font-family: sans-serif;
      -ms-text-size-adjust: 100%;
      -webkit-text-size-adjust: 100%;
      }
      body {
      margin: 0;
      }
      article,
      aside,
      details,
      figcaption,
      figure,
      footer,
      header,
      hgroup,
      main,
      menu,
      nav,
      section,
      summary {
      display: block;
      }
      audio,
      canvas,
      progress,
      video {
      display: inline-block;
      vertical-align: baseline;
      }
      audio:not([controls]) {
      display: none;
      height: 0;
      }
      [hidden],
      template {
      display: none;
      }
      a {
      background-color: transparent;
      }
      a:active,
      a:hover {
      outline: 0;
      }
      abbr[title] {
      border-bottom: none;
      text-decoration: underline;
      text-decoration: underline dotted;
      }
      b,
      strong {
      font-weight: bold;
      }
      dfn {
      font-style: italic;
      }
      h1 {
      font-size: 2em;
      margin: 0.67em 0;
      }
      mark {
      background: #ff0;
      color: #000;
      }
      small {
      font-size: 80%;
      }
      sub,
      sup {
      font-size: 75%;
      line-height: 0;
      position: relative;
      vertical-align: baseline;
      }
      sup {
      top: -0.5em;
      }
      sub {
      bottom: -0.25em;
      }
      img {
      border: 0;
      }
      svg:not(:root) {
      overflow: hidden;
      }
      figure {
      margin: 1em 40px;
      }
      hr {
      -webkit-box-sizing: content-box;
      -moz-box-sizing: content-box;
      box-sizing: content-box;
      height: 0;
      }
      pre {
      overflow: auto;
      }
      code,
      kbd,
      pre,
      samp {
      font-family: monospace, monospace;
      font-size: 1em;
      }
      button,
      input,
      optgroup,
      select,
      textarea {
      color: inherit;
      font: inherit;
      margin: 0;
      }
      button {
      overflow: visible;
      }
      button,
      select {
      text-transform: none;
      }
      button,
      html input[type="button"],
      input[type="reset"],
      input[type="submit"] {
      -webkit-appearance: button;
      cursor: pointer;
      }
      button[disabled],
      html input[disabled] {
      cursor: default;
      }
      button::-moz-focus-inner,
      input::-moz-focus-inner {
      border: 0;
      padding: 0;
      }
      input {
      line-height: normal;
      }
      input[type="checkbox"],
      input[type="radio"] {
      -webkit-box-sizing: border-box;
      -moz-box-sizing: border-box;
      box-sizing: border-box;
      padding: 0;
      }
      input[type="number"]::-webkit-inner-spin-button,
      input[type="number"]::-webkit-outer-spin-button {
      height: auto;
      }
      input[type="search"] {
      -webkit-appearance: textfield;
      -webkit-box-sizing: content-box;
      -moz-box-sizing: content-box;
      box-sizing: content-box;
      }
      input[type="search"]::-webkit-search-cancel-button,
      input[type="search"]::-webkit-search-decoration {
      -webkit-appearance: none;
      }
      fieldset {
      border: 1px solid #c0c0c0;
      margin: 0 2px;
      padding: 0.35em 0.625em 0.75em;
      }
      legend {
      border: 0;
      padding: 0;
      }
      textarea {
      overflow: auto;
      }
      optgroup {
      font-weight: bold;
      }
      table {
      border-collapse: collapse;
      border-spacing: 0;
      }
      td,
      th {
      padding: 0;
      }
      /*! Source: https://github.com/h5bp/html5-boilerplate/blob/master/src/css/main.css */
      @media print {
      *,
      *:before,
      *:after {
      color: #000 !important;
      text-shadow: none !important;
      background: transparent !important;
      -webkit-box-shadow: none !important;
      box-shadow: none !important;
      }
      a,
      a:visited {
      text-decoration: underline;
      }
      a[href]:after {
      content: " (" attr(href) ")";
      }
      abbr[title]:after {
      content: " (" attr(title) ")";
      }
      a[href^="#"]:after,
      a[href^="javascript:"]:after {
      content: "";
      }
      pre,
      blockquote {
      border: 1px solid #999;
      page-break-inside: avoid;
      }
      thead {
      display: table-header-group;
      }
      tr,
      img {
      page-break-inside: avoid;
      }
      img {
      max-width: 100% !important;
      }
      p,
      h2,
      h3 {
      orphans: 3;
      widows: 3;
      }
      h2,
      h3 {
      page-break-after: avoid;
      }
      .navbar {
      display: none;
      }
      .btn > .caret,
      .dropup > .btn > .caret {
      border-top-color: #000 !important;
      }
      .label {
      border: 1px solid #000;
      }
      .table {
      border-collapse: collapse !important;
      }
      .table td,
      .table th {
      background-color: #fff !important;
      }
      .table-bordered th,
      .table-bordered td {
      border: 1px solid #ddd !important;
      }
      }
      * {
      -webkit-box-sizing: border-box;
      -moz-box-sizing: border-box;
      box-sizing: border-box;
      }
      *:before,
      *:after {
      -webkit-box-sizing: border-box;
      -moz-box-sizing: border-box;
      box-sizing: border-box;
      }
      html {
      font-size: 10px;
      -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
      }
      body {
      font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
      font-size: 14px;
      line-height: 1.42857143;
      color: #333333;
      background-color: #ffffff;
      }
      input,
      button,
      select,
      textarea {
      font-family: inherit;
      font-size: inherit;
      line-height: inherit;
      }
      a {
      color: #337ab7;
      text-decoration: none;
      }
      a:hover,
      a:focus {
      color: #23527c;
      text-decoration: underline;
      }
      a:focus {
      outline: 5px auto -webkit-focus-ring-color;
      outline-offset: -2px;
      }
      figure {
      margin: 0;
      }
      img {
      vertical-align: middle;
      }
      .img-responsive {
      display: block;
      max-width: 100%;
      height: auto;
      }
      .img-rounded {
      border-radius: 6px;
      }
      .img-thumbnail {
      padding: 4px;
      line-height: 1.42857143;
      background-color: #ffffff;
      border: 1px solid #dddddd;
      border-radius: 4px;
      -webkit-transition: all 0.2s ease-in-out;
      -o-transition: all 0.2s ease-in-out;
      transition: all 0.2s ease-in-out;
      display: inline-block;
      max-width: 100%;
      height: auto;
      }
      .img-circle {
      border-radius: 50%;
      }
      hr {
      margin-top: 20px;
      margin-bottom: 20px;
      border: 0;
      border-top: 1px solid #eeeeee;
      }
      .sr-only {
      position: absolute;
      width: 1px;
      height: 1px;
      padding: 0;
      margin: -1px;
      overflow: hidden;
      clip: rect(0, 0, 0, 0);
      border: 0;
      }
      .sr-only-focusable:active,
      .sr-only-focusable:focus {
      position: static;
      width: auto;
      height: auto;
      margin: 0;
      overflow: visible;
      clip: auto;
      }
      [role="button"] {
      cursor: pointer;
      }
      h1,
      h2,
      h3,
      h4,
      h5,
      h6,
      .h1,
      .h2,
      .h3,
      .h4,
      .h5,
      .h6 {
      font-family: inherit;
      font-weight: 500;
      line-height: 1.1;
      color: inherit;
      }
      h1 small,
      h2 small,
      h3 small,
      h4 small,
      h5 small,
      h6 small,
      .h1 small,
      .h2 small,
      .h3 small,
      .h4 small,
      .h5 small,
      .h6 small,
      h1 .small,
      h2 .small,
      h3 .small,
      h4 .small,
      h5 .small,
      h6 .small,
      .h1 .small,
      .h2 .small,
      .h3 .small,
      .h4 .small,
      .h5 .small,
      .h6 .small {
      font-weight: 400;
      line-height: 1;
      color: #777777;
      }
      h1,
      .h1,
      h2,
      .h2,
      h3,
      .h3 {
      margin-top: 20px;
      margin-bottom: 10px;
      }
      h1 small,
      .h1 small,
      h2 small,
      .h2 small,
      h3 small,
      .h3 small,
      h1 .small,
      .h1 .small,
      h2 .small,
      .h2 .small,
      h3 .small,
      .h3 .small {
      font-size: 65%;
      }
      h4,
      .h4,
      h5,
      .h5,
      h6,
      .h6 {
      margin-top: 10px;
      margin-bottom: 10px;
      }
      h4 small,
      .h4 small,
      h5 small,
      .h5 small,
      h6 small,
      .h6 small,
      h4 .small,
      .h4 .small,
      h5 .small,
      .h5 .small,
      h6 .small,
      .h6 .small {
      font-size: 75%;
      }
      h1,
      .h1 {
      font-size: 36px;
      }
      h2,
      .h2 {
      font-size: 30px;
      }
      h3,
      .h3 {
      font-size: 24px;
      }
      h4,
      .h4 {
      font-size: 18px;
      }
      h5,
      .h5 {
      font-size: 14px;
      }
      h6,
      .h6 {
      font-size: 12px;
      }
      p {
      margin: 0 0 10px;
      }
      .lead {
      margin-bottom: 20px;
      font-size: 16px;
      font-weight: 300;
      line-height: 1.4;
      }
      @media (min-width: 768px) {
      .lead {
      font-size: 21px;
      }
      }
      small,
      .small {
      font-size: 85%;
      }
      mark,
      .mark {
      padding: .2em;
      background-color: #fcf8e3;
      }
      .text-left {
      text-align: left;
      }
      .text-right {
      text-align: right;
      }
      .text-center {
      text-align: center;
      }
      .text-justify {
      text-align: justify;
      }
      .text-nowrap {
      white-space: nowrap;
      }
      .text-lowercase {
      text-transform: lowercase;
      }
      .text-uppercase {
      text-transform: uppercase;
      }
      .text-capitalize {
      text-transform: capitalize;
      }
      .text-muted {
      color: #777777;
      }
      .text-primary {
      color: #337ab7;
      }
      a.text-primary:hover,
      a.text-primary:focus {
      color: #286090;
      }
      .text-success {
      color: #3c763d;
      }
      a.text-success:hover,
      a.text-success:focus {
      color: #2b542c;
      }
      .text-info {
      color: #31708f;
      }
      a.text-info:hover,
      a.text-info:focus {
      color: #245269;
      }
      .text-warning {
      color: #8a6d3b;
      }
      a.text-warning:hover,
      a.text-warning:focus {
      color: #66512c;
      }
      .text-danger {
      color: #a94442;
      }
      a.text-danger:hover,
      a.text-danger:focus {
      color: #843534;
      }
      .bg-primary {
      color: #fff;
      background-color: #337ab7;
      }
      a.bg-primary:hover,
      a.bg-primary:focus {
      background-color: #286090;
      }
      .bg-success {
      background-color: #dff0d8;
      }
      a.bg-success:hover,
      a.bg-success:focus {
      background-color: #c1e2b3;
      }
      .bg-info {
      background-color: #d9edf7;
      }
      a.bg-info:hover,
      a.bg-info:focus {
      background-color: #afd9ee;
      }
      .bg-warning {
      background-color: #fcf8e3;
      }
      a.bg-warning:hover,
      a.bg-warning:focus {
      background-color: #f7ecb5;
      }
      .bg-danger {
      background-color: #f2dede;
      }
      a.bg-danger:hover,
      a.bg-danger:focus {
      background-color: #e4b9b9;
      }
      .page-header {
      padding-bottom: 9px;
      margin: 40px 0 20px;
      border-bottom: 1px solid #eeeeee;
      }
      ul,
      ol {
      margin-top: 0;
      margin-bottom: 10px;
      }
      ul ul,
      ol ul,
      ul ol,
      ol ol {
      margin-bottom: 0;
      }
      .list-unstyled {
      padding-left: 0;
      list-style: none;
      }
      .list-inline {
      padding-left: 0;
      list-style: none;
      margin-left: -5px;
      }
      .list-inline > li {
      display: inline-block;
      padding-right: 5px;
      padding-left: 5px;
      }
      dl {
      margin-top: 0;
      margin-bottom: 20px;
      }
      dt,
      dd {
      line-height: 1.42857143;
      }
      dt {
      font-weight: 700;
      }
      dd {
      margin-left: 0;
      }
      @media (min-width: 768px) {
      .dl-horizontal dt {
      float: left;
      width: 160px;
      clear: left;
      text-align: right;
      overflow: hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
      }
      .dl-horizontal dd {
      margin-left: 180px;
      }
      }
      abbr[title],
      abbr[data-original-title] {
      cursor: help;
      }
      .initialism {
      font-size: 90%;
      text-transform: uppercase;
      }
      blockquote {
      padding: 10px 20px;
      margin: 0 0 20px;
      font-size: 17.5px;
      border-left: 5px solid #eeeeee;
      }
      blockquote p:last-child,
      blockquote ul:last-child,
      blockquote ol:last-child {
      margin-bottom: 0;
      }
      blockquote footer,
      blockquote small,
      blockquote .small {
      display: block;
      font-size: 80%;
      line-height: 1.42857143;
      color: #777777;
      }
      blockquote footer:before,
      blockquote small:before,
      blockquote .small:before {
      content: "\2014 \00A0";
      }
      .blockquote-reverse,
      blockquote.pull-right {
      padding-right: 15px;
      padding-left: 0;
      text-align: right;
      border-right: 5px solid #eeeeee;
      border-left: 0;
      }
      .blockquote-reverse footer:before,
      blockquote.pull-right footer:before,
      .blockquote-reverse small:before,
      blockquote.pull-right small:before,
      .blockquote-reverse .small:before,
      blockquote.pull-right .small:before {
      content: "";
      }
      .blockquote-reverse footer:after,
      blockquote.pull-right footer:after,
      .blockquote-reverse small:after,
      blockquote.pull-right small:after,
      .blockquote-reverse .small:after,
      blockquote.pull-right .small:after {
      content: "\00A0 \2014";
      }
      address {
      margin-bottom: 20px;
      font-style: normal;
      line-height: 1.42857143;
      }
      .container {
      padding-right: 15px;
      padding-left: 15px;
      margin-right: auto;
      margin-left: auto;
      }
      @media (min-width: 768px) {
      .container {
      width: 750px;
      }
      }
      @media (min-width: 992px) {
      .container {
      width: 970px;
      }
      }
      @media (min-width: 1200px) {
      .container {
      width: 1170px;
      }
      }
      .container-fluid {
      padding-right: 15px;
      padding-left: 15px;
      margin-right: auto;
      margin-left: auto;
      }
      .row {
      margin-right: -15px;
      margin-left: -15px;
      }
      .row-no-gutters {
      margin-right: 0;
      margin-left: 0;
      }
      .row-no-gutters [class*="col-"] {
      padding-right: 0;
      padding-left: 0;
      }
      .col-xs-1, .col-sm-1, .col-md-1, .col-lg-1, .col-xs-2, .col-sm-2, .col-md-2, .col-lg-2, .col-xs-3, .col-sm-3, .col-md-3, .col-lg-3, .col-xs-4, .col-sm-4, .col-md-4, .col-lg-4, .col-xs-5, .col-sm-5, .col-md-5, .col-lg-5, .col-xs-6, .col-sm-6, .col-md-6, .col-lg-6, .col-xs-7, .col-sm-7, .col-md-7, .col-lg-7, .col-xs-8, .col-sm-8, .col-md-8, .col-lg-8, .col-xs-9, .col-sm-9, .col-md-9, .col-lg-9, .col-xs-10, .col-sm-10, .col-md-10, .col-lg-10, .col-xs-11, .col-sm-11, .col-md-11, .col-lg-11, .col-xs-12, .col-sm-12, .col-md-12, .col-lg-12 {
      position: relative;
      min-height: 1px;
      padding-right: 15px;
      padding-left: 15px;
      }
      .col-xs-1, .col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5, .col-xs-6, .col-xs-7, .col-xs-8, .col-xs-9, .col-xs-10, .col-xs-11, .col-xs-12 {
      float: left;
      }
      .col-xs-12 {
      width: 100%;
      }
      .col-xs-11 {
      width: 91.66666667%;
      }
      .col-xs-10 {
      width: 83.33333333%;
      }
      .col-xs-9 {
      width: 75%;
      }
      .col-xs-8 {
      width: 66.66666667%;
      }
      .col-xs-7 {
      width: 58.33333333%;
      }
      .col-xs-6 {
      width: 50%;
      }
      .col-xs-5 {
      width: 41.66666667%;
      }
      .col-xs-4 {
      width: 33.33333333%;
      }
      .col-xs-3 {
      width: 25%;
      }
      .col-xs-2 {
      width: 16.66666667%;
      }
      .col-xs-1 {
      width: 8.33333333%;
      }
      .col-xs-pull-12 {
      right: 100%;
      }
      .col-xs-pull-11 {
      right: 91.66666667%;
      }
      .col-xs-pull-10 {
      right: 83.33333333%;
      }
      .col-xs-pull-9 {
      right: 75%;
      }
      .col-xs-pull-8 {
      right: 66.66666667%;
      }
      .col-xs-pull-7 {
      right: 58.33333333%;
      }
      .col-xs-pull-6 {
      right: 50%;
      }
      .col-xs-pull-5 {
      right: 41.66666667%;
      }
      .col-xs-pull-4 {
      right: 33.33333333%;
      }
      .col-xs-pull-3 {
      right: 25%;
      }
      .col-xs-pull-2 {
      right: 16.66666667%;
      }
      .col-xs-pull-1 {
      right: 8.33333333%;
      }
      .col-xs-pull-0 {
      right: auto;
      }
      .col-xs-push-12 {
      left: 100%;
      }
      .col-xs-push-11 {
      left: 91.66666667%;
      }
      .col-xs-push-10 {
      left: 83.33333333%;
      }
      .col-xs-push-9 {
      left: 75%;
      }
      .col-xs-push-8 {
      left: 66.66666667%;
      }
      .col-xs-push-7 {
      left: 58.33333333%;
      }
      .col-xs-push-6 {
      left: 50%;
      }
      .col-xs-push-5 {
      left: 41.66666667%;
      }
      .col-xs-push-4 {
      left: 33.33333333%;
      }
      .col-xs-push-3 {
      left: 25%;
      }
      .col-xs-push-2 {
      left: 16.66666667%;
      }
      .col-xs-push-1 {
      left: 8.33333333%;
      }
      .col-xs-push-0 {
      left: auto;
      }
      .col-xs-offset-12 {
      margin-left: 100%;
      }
      .col-xs-offset-11 {
      margin-left: 91.66666667%;
      }
      .col-xs-offset-10 {
      margin-left: 83.33333333%;
      }
      .col-xs-offset-9 {
      margin-left: 75%;
      }
      .col-xs-offset-8 {
      margin-left: 66.66666667%;
      }
      .col-xs-offset-7 {
      margin-left: 58.33333333%;
      }
      .col-xs-offset-6 {
      margin-left: 50%;
      }
      .col-xs-offset-5 {
      margin-left: 41.66666667%;
      }
      .col-xs-offset-4 {
      margin-left: 33.33333333%;
      }
      .col-xs-offset-3 {
      margin-left: 25%;
      }
      .col-xs-offset-2 {
      margin-left: 16.66666667%;
      }
      .col-xs-offset-1 {
      margin-left: 8.33333333%;
      }
      .col-xs-offset-0 {
      margin-left: 0%;
      }
      @media (min-width: 768px) {
      .col-sm-1, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6, .col-sm-7, .col-sm-8, .col-sm-9, .col-sm-10, .col-sm-11, .col-sm-12 {
      float: left;
      }
      .col-sm-12 {
      width: 100%;
      }
      .col-sm-11 {
      width: 91.66666667%;
      }
      .col-sm-10 {
      width: 83.33333333%;
      }
      .col-sm-9 {
      width: 75%;
      }
      .col-sm-8 {
      width: 66.66666667%;
      }
      .col-sm-7 {
      width: 58.33333333%;
      }
      .col-sm-6 {
      width: 50%;
      }
      .col-sm-5 {
      width: 41.66666667%;
      }
      .col-sm-4 {
      width: 33.33333333%;
      }
      .col-sm-3 {
      width: 25%;
      }
      .col-sm-2 {
      width: 16.66666667%;
      }
      .col-sm-1 {
      width: 8.33333333%;
      }
      .col-sm-pull-12 {
      right: 100%;
      }
      .col-sm-pull-11 {
      right: 91.66666667%;
      }
      .col-sm-pull-10 {
      right: 83.33333333%;
      }
      .col-sm-pull-9 {
      right: 75%;
      }
      .col-sm-pull-8 {
      right: 66.66666667%;
      }
      .col-sm-pull-7 {
      right: 58.33333333%;
      }
      .col-sm-pull-6 {
      right: 50%;
      }
      .col-sm-pull-5 {
      right: 41.66666667%;
      }
      .col-sm-pull-4 {
      right: 33.33333333%;
      }
      .col-sm-pull-3 {
      right: 25%;
      }
      .col-sm-pull-2 {
      right: 16.66666667%;
      }
      .col-sm-pull-1 {
      right: 8.33333333%;
      }
      .col-sm-pull-0 {
      right: auto;
      }
      .col-sm-push-12 {
      left: 100%;
      }
      .col-sm-push-11 {
      left: 91.66666667%;
      }
      .col-sm-push-10 {
      left: 83.33333333%;
      }
      .col-sm-push-9 {
      left: 75%;
      }
      .col-sm-push-8 {
      left: 66.66666667%;
      }
      .col-sm-push-7 {
      left: 58.33333333%;
      }
      .col-sm-push-6 {
      left: 50%;
      }
      .col-sm-push-5 {
      left: 41.66666667%;
      }
      .col-sm-push-4 {
      left: 33.33333333%;
      }
      .col-sm-push-3 {
      left: 25%;
      }
      .col-sm-push-2 {
      left: 16.66666667%;
      }
      .col-sm-push-1 {
      left: 8.33333333%;
      }
      .col-sm-push-0 {
      left: auto;
      }
      .col-sm-offset-12 {
      margin-left: 100%;
      }
      .col-sm-offset-11 {
      margin-left: 91.66666667%;
      }
      .col-sm-offset-10 {
      margin-left: 83.33333333%;
      }
      .col-sm-offset-9 {
      margin-left: 75%;
      }
      .col-sm-offset-8 {
      margin-left: 66.66666667%;
      }
      .col-sm-offset-7 {
      margin-left: 58.33333333%;
      }
      .col-sm-offset-6 {
      margin-left: 50%;
      }
      .col-sm-offset-5 {
      margin-left: 41.66666667%;
      }
      .col-sm-offset-4 {
      margin-left: 33.33333333%;
      }
      .col-sm-offset-3 {
      margin-left: 25%;
      }
      .col-sm-offset-2 {
      margin-left: 16.66666667%;
      }
      .col-sm-offset-1 {
      margin-left: 8.33333333%;
      }
      .col-sm-offset-0 {
      margin-left: 0%;
      }
      }
      @media (min-width: 992px) {
      .col-md-1, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6, .col-md-7, .col-md-8, .col-md-9, .col-md-10, .col-md-11, .col-md-12 {
      float: left;
      }
      .col-md-12 {
      width: 100%;
      }
      .col-md-11 {
      width: 91.66666667%;
      }
      .col-md-10 {
      width: 83.33333333%;
      }
      .col-md-9 {
      width: 75%;
      }
      .col-md-8 {
      width: 66.66666667%;
      }
      .col-md-7 {
      width: 58.33333333%;
      }
      .col-md-6 {
      width: 50%;
      }
      .col-md-5 {
      width: 41.66666667%;
      }
      .col-md-4 {
      width: 33.33333333%;
      }
      .col-md-3 {
      width: 25%;
      }
      .col-md-2 {
      width: 16.66666667%;
      }
      .col-md-1 {
      width: 8.33333333%;
      }
      .col-md-pull-12 {
      right: 100%;
      }
      .col-md-pull-11 {
      right: 91.66666667%;
      }
      .col-md-pull-10 {
      right: 83.33333333%;
      }
      .col-md-pull-9 {
      right: 75%;
      }
      .col-md-pull-8 {
      right: 66.66666667%;
      }
      .col-md-pull-7 {
      right: 58.33333333%;
      }
      .col-md-pull-6 {
      right: 50%;
      }
      .col-md-pull-5 {
      right: 41.66666667%;
      }
      .col-md-pull-4 {
      right: 33.33333333%;
      }
      .col-md-pull-3 {
      right: 25%;
      }
      .col-md-pull-2 {
      right: 16.66666667%;
      }
      .col-md-pull-1 {
      right: 8.33333333%;
      }
      .col-md-pull-0 {
      right: auto;
      }
      .col-md-push-12 {
      left: 100%;
      }
      .col-md-push-11 {
      left: 91.66666667%;
      }
      .col-md-push-10 {
      left: 83.33333333%;
      }
      .col-md-push-9 {
      left: 75%;
      }
      .col-md-push-8 {
      left: 66.66666667%;
      }
      .col-md-push-7 {
      left: 58.33333333%;
      }
      .col-md-push-6 {
      left: 50%;
      }
      .col-md-push-5 {
      left: 41.66666667%;
      }
      .col-md-push-4 {
      left: 33.33333333%;
      }
      .col-md-push-3 {
      left: 25%;
      }
      .col-md-push-2 {
      left: 16.66666667%;
      }
      .col-md-push-1 {
      left: 8.33333333%;
      }
      .col-md-push-0 {
      left: auto;
      }
      .col-md-offset-12 {
      margin-left: 100%;
      }
      .col-md-offset-11 {
      margin-left: 91.66666667%;
      }
      .col-md-offset-10 {
      margin-left: 83.33333333%;
      }
      .col-md-offset-9 {
      margin-left: 75%;
      }
      .col-md-offset-8 {
      margin-left: 66.66666667%;
      }
      .col-md-offset-7 {
      margin-left: 58.33333333%;
      }
      .col-md-offset-6 {
      margin-left: 50%;
      }
      .col-md-offset-5 {
      margin-left: 41.66666667%;
      }
      .col-md-offset-4 {
      margin-left: 33.33333333%;
      }
      .col-md-offset-3 {
      margin-left: 25%;
      }
      .col-md-offset-2 {
      margin-left: 16.66666667%;
      }
      .col-md-offset-1 {
      margin-left: 8.33333333%;
      }
      .col-md-offset-0 {
      margin-left: 0%;
      }
      }
      @media (min-width: 1200px) {
      .col-lg-1, .col-lg-2, .col-lg-3, .col-lg-4, .col-lg-5, .col-lg-6, .col-lg-7, .col-lg-8, .col-lg-9, .col-lg-10, .col-lg-11, .col-lg-12 {
      float: left;
      }
      .col-lg-12 {
      width: 100%;
      }
      .col-lg-11 {
      width: 91.66666667%;
      }
      .col-lg-10 {
      width: 83.33333333%;
      }
      .col-lg-9 {
      width: 75%;
      }
      .col-lg-8 {
      width: 66.66666667%;
      }
      .col-lg-7 {
      width: 58.33333333%;
      }
      .col-lg-6 {
      width: 50%;
      }
      .col-lg-5 {
      width: 41.66666667%;
      }
      .col-lg-4 {
      width: 33.33333333%;
      }
      .col-lg-3 {
      width: 25%;
      }
      .col-lg-2 {
      width: 16.66666667%;
      }
      .col-lg-1 {
      width: 8.33333333%;
      }
      .col-lg-pull-12 {
      right: 100%;
      }
      .col-lg-pull-11 {
      right: 91.66666667%;
      }
      .col-lg-pull-10 {
      right: 83.33333333%;
      }
      .col-lg-pull-9 {
      right: 75%;
      }
      .col-lg-pull-8 {
      right: 66.66666667%;
      }
      .col-lg-pull-7 {
      right: 58.33333333%;
      }
      .col-lg-pull-6 {
      right: 50%;
      }
      .col-lg-pull-5 {
      right: 41.66666667%;
      }
      .col-lg-pull-4 {
      right: 33.33333333%;
      }
      .col-lg-pull-3 {
      right: 25%;
      }
      .col-lg-pull-2 {
      right: 16.66666667%;
      }
      .col-lg-pull-1 {
      right: 8.33333333%;
      }
      .col-lg-pull-0 {
      right: auto;
      }
      .col-lg-push-12 {
      left: 100%;
      }
      .col-lg-push-11 {
      left: 91.66666667%;
      }
      .col-lg-push-10 {
      left: 83.33333333%;
      }
      .col-lg-push-9 {
      left: 75%;
      }
      .col-lg-push-8 {
      left: 66.66666667%;
      }
      .col-lg-push-7 {
      left: 58.33333333%;
      }
      .col-lg-push-6 {
      left: 50%;
      }
      .col-lg-push-5 {
      left: 41.66666667%;
      }
      .col-lg-push-4 {
      left: 33.33333333%;
      }
      .col-lg-push-3 {
      left: 25%;
      }
      .col-lg-push-2 {
      left: 16.66666667%;
      }
      .col-lg-push-1 {
      left: 8.33333333%;
      }
      .col-lg-push-0 {
      left: auto;
      }
      .col-lg-offset-12 {
      margin-left: 100%;
      }
      .col-lg-offset-11 {
      margin-left: 91.66666667%;
      }
      .col-lg-offset-10 {
      margin-left: 83.33333333%;
      }
      .col-lg-offset-9 {
      margin-left: 75%;
      }
      .col-lg-offset-8 {
      margin-left: 66.66666667%;
      }
      .col-lg-offset-7 {
      margin-left: 58.33333333%;
      }
      .col-lg-offset-6 {
      margin-left: 50%;
      }
      .col-lg-offset-5 {
      margin-left: 41.66666667%;
      }
      .col-lg-offset-4 {
      margin-left: 33.33333333%;
      }
      .col-lg-offset-3 {
      margin-left: 25%;
      }
      .col-lg-offset-2 {
      margin-left: 16.66666667%;
      }
      .col-lg-offset-1 {
      margin-left: 8.33333333%;
      }
      .col-lg-offset-0 {
      margin-left: 0%;
      }
      }
      table {
      background-color: transparent;
      }
      table col[class*="col-"] {
      position: static;
      display: table-column;
      float: none;
      }
      table td[class*="col-"],
      table th[class*="col-"] {
      position: static;
      display: table-cell;
      float: none;
      }
      caption {
      padding-top: 8px;
      padding-bottom: 8px;
      color: #777777;
      text-align: left;
      }
      th {
      text-align: left;
      }
      .table {
      width: 100%;
      max-width: 100%;
      margin-bottom: 20px;
      }
      .table > thead > tr > th,
      .table > tbody > tr > th,
      .table > tfoot > tr > th,
      .table > thead > tr > td,
      .table > tbody > tr > td,
      .table > tfoot > tr > td {
      padding: 8px;
      line-height: 1.42857143;
      vertical-align: top;
      border-top: 1px solid #dddddd;
      }
      .table > thead > tr > th {
      vertical-align: bottom;
      border-bottom: 2px solid #dddddd;
      }
      .table > caption + thead > tr:first-child > th,
      .table > colgroup + thead > tr:first-child > th,
      .table > thead:first-child > tr:first-child > th,
      .table > caption + thead > tr:first-child > td,
      .table > colgroup + thead > tr:first-child > td,
      .table > thead:first-child > tr:first-child > td {
      border-top: 0;
      }
      .table > tbody + tbody {
      border-top: 2px solid #dddddd;
      }
      .table .table {
      background-color: #ffffff;
      }
      .table-condensed > thead > tr > th,
      .table-condensed > tbody > tr > th,
      .table-condensed > tfoot > tr > th,
      .table-condensed > thead > tr > td,
      .table-condensed > tbody > tr > td,
      .table-condensed > tfoot > tr > td {
      padding: 5px;
      }
      .table-bordered {
      border: 1px solid #dddddd;
      }
      .table-bordered > thead > tr > th,
      .table-bordered > tbody > tr > th,
      .table-bordered > tfoot > tr > th,
      .table-bordered > thead > tr > td,
      .table-bordered > tbody > tr > td,
      .table-bordered > tfoot > tr > td {
      border: 1px solid #dddddd;
      }
      .table-bordered > thead > tr > th,
      .table-bordered > thead > tr > td {
      border-bottom-width: 2px;
      }
      .table-striped > tbody > tr:nth-of-type(odd) {
      background-color: #f9f9f9;
      }
      .table-hover > tbody > tr:hover {
      background-color: #f5f5f5;
      }
      .table > thead > tr > td.active,
      .table > tbody > tr > td.active,
      .table > tfoot > tr > td.active,
      .table > thead > tr > th.active,
      .table > tbody > tr > th.active,
      .table > tfoot > tr > th.active,
      .table > thead > tr.active > td,
      .table > tbody > tr.active > td,
      .table > tfoot > tr.active > td,
      .table > thead > tr.active > th,
      .table > tbody > tr.active > th,
      .table > tfoot > tr.active > th {
      background-color: #f5f5f5;
      }
      .table-hover > tbody > tr > td.active:hover,
      .table-hover > tbody > tr > th.active:hover,
      .table-hover > tbody > tr.active:hover > td,
      .table-hover > tbody > tr:hover > .active,
      .table-hover > tbody > tr.active:hover > th {
      background-color: #e8e8e8;
      }
      .table > thead > tr > td.success,
      .table > tbody > tr > td.success,
      .table > tfoot > tr > td.success,
      .table > thead > tr > th.success,
      .table > tbody > tr > th.success,
      .table > tfoot > tr > th.success,
      .table > thead > tr.success > td,
      .table > tbody > tr.success > td,
      .table > tfoot > tr.success > td,
      .table > thead > tr.success > th,
      .table > tbody > tr.success > th,
      .table > tfoot > tr.success > th {
      background-color: #dff0d8;
      }
      .table-hover > tbody > tr > td.success:hover,
      .table-hover > tbody > tr > th.success:hover,
      .table-hover > tbody > tr.success:hover > td,
      .table-hover > tbody > tr:hover > .success,
      .table-hover > tbody > tr.success:hover > th {
      background-color: #d0e9c6;
      }
      .table > thead > tr > td.info,
      .table > tbody > tr > td.info,
      .table > tfoot > tr > td.info,
      .table > thead > tr > th.info,
      .table > tbody > tr > th.info,
      .table > tfoot > tr > th.info,
      .table > thead > tr.info > td,
      .table > tbody > tr.info > td,
      .table > tfoot > tr.info > td,
      .table > thead > tr.info > th,
      .table > tbody > tr.info > th,
      .table > tfoot > tr.info > th {
      background-color: #d9edf7;
      }
      .table-hover > tbody > tr > td.info:hover,
      .table-hover > tbody > tr > th.info:hover,
      .table-hover > tbody > tr.info:hover > td,
      .table-hover > tbody > tr:hover > .info,
      .table-hover > tbody > tr.info:hover > th {
      background-color: #c4e3f3;
      }
      .table > thead > tr > td.warning,
      .table > tbody > tr > td.warning,
      .table > tfoot > tr > td.warning,
      .table > thead > tr > th.warning,
      .table > tbody > tr > th.warning,
      .table > tfoot > tr > th.warning,
      .table > thead > tr.warning > td,
      .table > tbody > tr.warning > td,
      .table > tfoot > tr.warning > td,
      .table > thead > tr.warning > th,
      .table > tbody > tr.warning > th,
      .table > tfoot > tr.warning > th {
      background-color: #fcf8e3;
      }
      .table-hover > tbody > tr > td.warning:hover,
      .table-hover > tbody > tr > th.warning:hover,
      .table-hover > tbody > tr.warning:hover > td,
      .table-hover > tbody > tr:hover > .warning,
      .table-hover > tbody > tr.warning:hover > th {
      background-color: #faf2cc;
      }
      .table > thead > tr > td.danger,
      .table > tbody > tr > td.danger,
      .table > tfoot > tr > td.danger,
      .table > thead > tr > th.danger,
      .table > tbody > tr > th.danger,
      .table > tfoot > tr > th.danger,
      .table > thead > tr.danger > td,
      .table > tbody > tr.danger > td,
      .table > tfoot > tr.danger > td,
      .table > thead > tr.danger > th,
      .table > tbody > tr.danger > th,
      .table > tfoot > tr.danger > th {
      background-color: #f2dede;
      }
      .table-hover > tbody > tr > td.danger:hover,
      .table-hover > tbody > tr > th.danger:hover,
      .table-hover > tbody > tr.danger:hover > td,
      .table-hover > tbody > tr:hover > .danger,
      .table-hover > tbody > tr.danger:hover > th {
      background-color: #ebcccc;
      }
      .table-responsive {
      min-height: .01%;
      overflow-x: auto;
      }
      @media screen and (max-width: 767px) {
      .table-responsive {
      width: 100%;
      margin-bottom: 15px;
      overflow-y: hidden;
      -ms-overflow-style: -ms-autohiding-scrollbar;
      border: 1px solid #dddddd;
      }
      .table-responsive > .table {
      margin-bottom: 0;
      }
      .table-responsive > .table > thead > tr > th,
      .table-responsive > .table > tbody > tr > th,
      .table-responsive > .table > tfoot > tr > th,
      .table-responsive > .table > thead > tr > td,
      .table-responsive > .table > tbody > tr > td,
      .table-responsive > .table > tfoot > tr > td {
      white-space: nowrap;
      }
      .table-responsive > .table-bordered {
      border: 0;
      }
      .table-responsive > .table-bordered > thead > tr > th:first-child,
      .table-responsive > .table-bordered > tbody > tr > th:first-child,
      .table-responsive > .table-bordered > tfoot > tr > th:first-child,
      .table-responsive > .table-bordered > thead > tr > td:first-child,
      .table-responsive > .table-bordered > tbody > tr > td:first-child,
      .table-responsive > .table-bordered > tfoot > tr > td:first-child {
      border-left: 0;
      }
      .table-responsive > .table-bordered > thead > tr > th:last-child,
      .table-responsive > .table-bordered > tbody > tr > th:last-child,
      .table-responsive > .table-bordered > tfoot > tr > th:last-child,
      .table-responsive > .table-bordered > thead > tr > td:last-child,
      .table-responsive > .table-bordered > tbody > tr > td:last-child,
      .table-responsive > .table-bordered > tfoot > tr > td:last-child {
      border-right: 0;
      }
      .table-responsive > .table-bordered > tbody > tr:last-child > th,
      .table-responsive > .table-bordered > tfoot > tr:last-child > th,
      .table-responsive > .table-bordered > tbody > tr:last-child > td,
      .table-responsive > .table-bordered > tfoot > tr:last-child > td {
      border-bottom: 0;
      }
      }
      .list-group {
      padding-left: 0;
      margin-bottom: 20px;
      }
      .list-group-item {
      position: relative;
      display: block;
      padding: 10px 15px;
      margin-bottom: -1px;
      background-color: #ffffff;
      border: 1px solid #dddddd;
      }
      .list-group-item:first-child {
      border-top-left-radius: 4px;
      border-top-right-radius: 4px;
      }
      .list-group-item:last-child {
      margin-bottom: 0;
      border-bottom-right-radius: 4px;
      border-bottom-left-radius: 4px;
      }
      .list-group-item.disabled,
      .list-group-item.disabled:hover,
      .list-group-item.disabled:focus {
      color: #777777;
      cursor: not-allowed;
      background-color: #eeeeee;
      }
      .list-group-item.disabled .list-group-item-heading,
      .list-group-item.disabled:hover .list-group-item-heading,
      .list-group-item.disabled:focus .list-group-item-heading {
      color: inherit;
      }
      .list-group-item.disabled .list-group-item-text,
      .list-group-item.disabled:hover .list-group-item-text,
      .list-group-item.disabled:focus .list-group-item-text {
      color: #777777;
      }
      .list-group-item.active,
      .list-group-item.active:hover,
      .list-group-item.active:focus {
      z-index: 2;
      color: #ffffff;
      background-color: #337ab7;
      border-color: #337ab7;
      }
      .list-group-item.active .list-group-item-heading,
      .list-group-item.active:hover .list-group-item-heading,
      .list-group-item.active:focus .list-group-item-heading,
      .list-group-item.active .list-group-item-heading > small,
      .list-group-item.active:hover .list-group-item-heading > small,
      .list-group-item.active:focus .list-group-item-heading > small,
      .list-group-item.active .list-group-item-heading > .small,
      .list-group-item.active:hover .list-group-item-heading > .small,
      .list-group-item.active:focus .list-group-item-heading > .small {
      color: inherit;
      }
      .list-group-item.active .list-group-item-text,
      .list-group-item.active:hover .list-group-item-text,
      .list-group-item.active:focus .list-group-item-text {
      color: #c7ddef;
      }
      a.list-group-item,
      button.list-group-item {
      color: #555555;
      }
      a.list-group-item .list-group-item-heading,
      button.list-group-item .list-group-item-heading {
      color: #333333;
      }
      a.list-group-item:hover,
      button.list-group-item:hover,
      a.list-group-item:focus,
      button.list-group-item:focus {
      color: #555555;
      text-decoration: none;
      background-color: #f5f5f5;
      }
      button.list-group-item {
      width: 100%;
      text-align: left;
      }
      .list-group-item-success {
      color: #3c763d;
      background-color: #dff0d8;
      }
      a.list-group-item-success,
      button.list-group-item-success {
      color: #3c763d;
      }
      a.list-group-item-success .list-group-item-heading,
      button.list-group-item-success .list-group-item-heading {
      color: inherit;
      }
      a.list-group-item-success:hover,
      button.list-group-item-success:hover,
      a.list-group-item-success:focus,
      button.list-group-item-success:focus {
      color: #3c763d;
      background-color: #d0e9c6;
      }
      a.list-group-item-success.active,
      button.list-group-item-success.active,
      a.list-group-item-success.active:hover,
      button.list-group-item-success.active:hover,
      a.list-group-item-success.active:focus,
      button.list-group-item-success.active:focus {
      color: #fff;
      background-color: #3c763d;
      border-color: #3c763d;
      }
      .list-group-item-info {
      color: #31708f;
      background-color: #d9edf7;
      }
      a.list-group-item-info,
      button.list-group-item-info {
      color: #31708f;
      }
      a.list-group-item-info .list-group-item-heading,
      button.list-group-item-info .list-group-item-heading {
      color: inherit;
      }
      a.list-group-item-info:hover,
      button.list-group-item-info:hover,
      a.list-group-item-info:focus,
      button.list-group-item-info:focus {
      color: #31708f;
      background-color: #c4e3f3;
      }
      a.list-group-item-info.active,
      button.list-group-item-info.active,
      a.list-group-item-info.active:hover,
      button.list-group-item-info.active:hover,
      a.list-group-item-info.active:focus,
      button.list-group-item-info.active:focus {
      color: #fff;
      background-color: #31708f;
      border-color: #31708f;
      }
      .list-group-item-warning {
      color: #8a6d3b;
      background-color: #fcf8e3;
      }
      a.list-group-item-warning,
      button.list-group-item-warning {
      color: #8a6d3b;
      }
      a.list-group-item-warning .list-group-item-heading,
      button.list-group-item-warning .list-group-item-heading {
      color: inherit;
      }
      a.list-group-item-warning:hover,
      button.list-group-item-warning:hover,
      a.list-group-item-warning:focus,
      button.list-group-item-warning:focus {
      color: #8a6d3b;
      background-color: #faf2cc;
      }
      a.list-group-item-warning.active,
      button.list-group-item-warning.active,
      a.list-group-item-warning.active:hover,
      button.list-group-item-warning.active:hover,
      a.list-group-item-warning.active:focus,
      button.list-group-item-warning.active:focus {
      color: #fff;
      background-color: #8a6d3b;
      border-color: #8a6d3b;
      }
      .list-group-item-danger {
      color: #a94442;
      background-color: #f2dede;
      }
      a.list-group-item-danger,
      button.list-group-item-danger {
      color: #a94442;
      }
      a.list-group-item-danger .list-group-item-heading,
      button.list-group-item-danger .list-group-item-heading {
      color: inherit;
      }
      a.list-group-item-danger:hover,
      button.list-group-item-danger:hover,
      a.list-group-item-danger:focus,
      button.list-group-item-danger:focus {
      color: #a94442;
      background-color: #ebcccc;
      }
      a.list-group-item-danger.active,
      button.list-group-item-danger.active,
      a.list-group-item-danger.active:hover,
      button.list-group-item-danger.active:hover,
      a.list-group-item-danger.active:focus,
      button.list-group-item-danger.active:focus {
      color: #fff;
      background-color: #a94442;
      border-color: #a94442;
      }
      .list-group-item-heading {
      margin-top: 0;
      margin-bottom: 5px;
      }
      .list-group-item-text {
      margin-bottom: 0;
      line-height: 1.3;
      }
      .panel {
      margin-bottom: 20px;
      background-color: #ffffff;
      border: 1px solid transparent;
      border-radius: 4px;
      -webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
      box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);


      }
      .panel-body {
      padding: 15px;
      }
      .panel-heading {
      padding: 10px 15px;
      border-bottom: 1px solid transparent;
      border-top-left-radius: 3px;
      border-top-right-radius: 3px;
      }
      .panel-heading > .dropdown .dropdown-toggle {
      color: inherit;
      }
      .panel-title {
      margin-top: 0;
      margin-bottom: 0;
      font-size: 16px;
      color: inherit;
      }
      .panel-title > a,
      .panel-title > small,
      .panel-title > .small,
      .panel-title > small > a,
      .panel-title > .small > a {
      color: inherit;
      }
      .panel-footer {
      padding: 10px 15px;
      background-color: #f5f5f5;
      border-top: 1px solid #dddddd;
      border-bottom-right-radius: 3px;
      border-bottom-left-radius: 3px;
      }
      .panel > .list-group,
      .panel > .panel-collapse > .list-group {
      margin-bottom: 0;
      }
      .panel > .list-group .list-group-item,
      .panel > .panel-collapse > .list-group .list-group-item {
      border-width: 1px 0;
      border-radius: 0;
      }
      .panel > .list-group:first-child .list-group-item:first-child,
      .panel > .panel-collapse > .list-group:first-child .list-group-item:first-child {
      border-top: 0;
      border-top-left-radius: 3px;
      border-top-right-radius: 3px;
      }
      .panel > .list-group:last-child .list-group-item:last-child,
      .panel > .panel-collapse > .list-group:last-child .list-group-item:last-child {
      border-bottom: 0;
      border-bottom-right-radius: 3px;
      border-bottom-left-radius: 3px;
      }
      .panel > .panel-heading + .panel-collapse > .list-group .list-group-item:first-child {
      border-top-left-radius: 0;
      border-top-right-radius: 0;
      }
      .panel-heading + .list-group .list-group-item:first-child {
      border-top-width: 0;
      }
      .list-group + .panel-footer {
      border-top-width: 0;
      }
      .panel > .table,
      .panel > .table-responsive > .table,
      .panel > .panel-collapse > .table {
      margin-bottom: 0;
      }
      .panel > .table caption,
      .panel > .table-responsive > .table caption,
      .panel > .panel-collapse > .table caption {
      padding-right: 15px;
      padding-left: 15px;
      }
      .panel > .table:first-child,
      .panel > .table-responsive:first-child > .table:first-child {
      border-top-left-radius: 3px;
      border-top-right-radius: 3px;
      }
      .panel > .table:first-child > thead:first-child > tr:first-child,
      .panel > .table-responsive:first-child > .table:first-child > thead:first-child > tr:first-child,
      .panel > .table:first-child > tbody:first-child > tr:first-child,
      .panel > .table-responsive:first-child > .table:first-child > tbody:first-child > tr:first-child {
      border-top-left-radius: 3px;
      border-top-right-radius: 3px;
      }
      .panel > .table:first-child > thead:first-child > tr:first-child td:first-child,
      .panel > .table-responsive:first-child > .table:first-child > thead:first-child > tr:first-child td:first-child,
      .panel > .table:first-child > tbody:first-child > tr:first-child td:first-child,
      .panel > .table-responsive:first-child > .table:first-child > tbody:first-child > tr:first-child td:first-child,
      .panel > .table:first-child > thead:first-child > tr:first-child th:first-child,
      .panel > .table-responsive:first-child > .table:first-child > thead:first-child > tr:first-child th:first-child,
      .panel > .table:first-child > tbody:first-child > tr:first-child th:first-child,
      .panel > .table-responsive:first-child > .table:first-child > tbody:first-child > tr:first-child th:first-child {
      border-top-left-radius: 3px;
      }
      .panel > .table:first-child > thead:first-child > tr:first-child td:last-child,
      .panel > .table-responsive:first-child > .table:first-child > thead:first-child > tr:first-child td:last-child,
      .panel > .table:first-child > tbody:first-child > tr:first-child td:last-child,
      .panel > .table-responsive:first-child > .table:first-child > tbody:first-child > tr:first-child td:last-child,
      .panel > .table:first-child > thead:first-child > tr:first-child th:last-child,
      .panel > .table-responsive:first-child > .table:first-child > thead:first-child > tr:first-child th:last-child,
      .panel > .table:first-child > tbody:first-child > tr:first-child th:last-child,
      .panel > .table-responsive:first-child > .table:first-child > tbody:first-child > tr:first-child th:last-child {
      border-top-right-radius: 3px;
      }
      .panel > .table:last-child,
      .panel > .table-responsive:last-child > .table:last-child {
      border-bottom-right-radius: 3px;
      border-bottom-left-radius: 3px;
      }
      .panel > .table:last-child > tbody:last-child > tr:last-child,
      .panel > .table-responsive:last-child > .table:last-child > tbody:last-child > tr:last-child,
      .panel > .table:last-child > tfoot:last-child > tr:last-child,
      .panel > .table-responsive:last-child > .table:last-child > tfoot:last-child > tr:last-child {
      border-bottom-right-radius: 3px;
      border-bottom-left-radius: 3px;
      }
      .panel > .table:last-child > tbody:last-child > tr:last-child td:first-child,
      .panel > .table-responsive:last-child > .table:last-child > tbody:last-child > tr:last-child td:first-child,
      .panel > .table:last-child > tfoot:last-child > tr:last-child td:first-child,
      .panel > .table-responsive:last-child > .table:last-child > tfoot:last-child > tr:last-child td:first-child,
      .panel > .table:last-child > tbody:last-child > tr:last-child th:first-child,
      .panel > .table-responsive:last-child > .table:last-child > tbody:last-child > tr:last-child th:first-child,
      .panel > .table:last-child > tfoot:last-child > tr:last-child th:first-child,
      .panel > .table-responsive:last-child > .table:last-child > tfoot:last-child > tr:last-child th:first-child {
      border-bottom-left-radius: 3px;
      }
      .panel > .table:last-child > tbody:last-child > tr:last-child td:last-child,
      .panel > .table-responsive:last-child > .table:last-child > tbody:last-child > tr:last-child td:last-child,
      .panel > .table:last-child > tfoot:last-child > tr:last-child td:last-child,
      .panel > .table-responsive:last-child > .table:last-child > tfoot:last-child > tr:last-child td:last-child,
      .panel > .table:last-child > tbody:last-child > tr:last-child th:last-child,
      .panel > .table-responsive:last-child > .table:last-child > tbody:last-child > tr:last-child th:last-child,
      .panel > .table:last-child > tfoot:last-child > tr:last-child th:last-child,
      .panel > .table-responsive:last-child > .table:last-child > tfoot:last-child > tr:last-child th:last-child {
      border-bottom-right-radius: 3px;
      }
      .panel > .panel-body + .table,
      .panel > .panel-body + .table-responsive,
      .panel > .table + .panel-body,
      .panel > .table-responsive + .panel-body {
      border-top: 1px solid #dddddd;
      }
      .panel > .table > tbody:first-child > tr:first-child th,
      .panel > .table > tbody:first-child > tr:first-child td {
      border-top: 0;
      }
      .panel > .table-bordered,
      .panel > .table-responsive > .table-bordered {
      border: 0;
      }
      .panel > .table-bordered > thead > tr > th:first-child,
      .panel > .table-responsive > .table-bordered > thead > tr > th:first-child,
      .panel > .table-bordered > tbody > tr > th:first-child,
      .panel > .table-responsive > .table-bordered > tbody > tr > th:first-child,
      .panel > .table-bordered > tfoot > tr > th:first-child,
      .panel > .table-responsive > .table-bordered > tfoot > tr > th:first-child,
      .panel > .table-bordered > thead > tr > td:first-child,
      .panel > .table-responsive > .table-bordered > thead > tr > td:first-child,
      .panel > .table-bordered > tbody > tr > td:first-child,
      .panel > .table-responsive > .table-bordered > tbody > tr > td:first-child,
      .panel > .table-bordered > tfoot > tr > td:first-child,
      .panel > .table-responsive > .table-bordered > tfoot > tr > td:first-child {
      border-left: 0;
      }
      .panel > .table-bordered > thead > tr > th:last-child,
      .panel > .table-responsive > .table-bordered > thead > tr > th:last-child,
      .panel > .table-bordered > tbody > tr > th:last-child,
      .panel > .table-responsive > .table-bordered > tbody > tr > th:last-child,
      .panel > .table-bordered > tfoot > tr > th:last-child,
      .panel > .table-responsive > .table-bordered > tfoot > tr > th:last-child,
      .panel > .table-bordered > thead > tr > td:last-child,
      .panel > .table-responsive > .table-bordered > thead > tr > td:last-child,
      .panel > .table-bordered > tbody > tr > td:last-child,
      .panel > .table-responsive > .table-bordered > tbody > tr > td:last-child,
      .panel > .table-bordered > tfoot > tr > td:last-child,
      .panel > .table-responsive > .table-bordered > tfoot > tr > td:last-child {
      border-right: 0;
      }
      .panel > .table-bordered > thead > tr:first-child > td,
      .panel > .table-responsive > .table-bordered > thead > tr:first-child > td,
      .panel > .table-bordered > tbody > tr:first-child > td,
      .panel > .table-responsive > .table-bordered > tbody > tr:first-child > td,
      .panel > .table-bordered > thead > tr:first-child > th,
      .panel > .table-responsive > .table-bordered > thead > tr:first-child > th,
      .panel > .table-bordered > tbody > tr:first-child > th,
      .panel > .table-responsive > .table-bordered > tbody > tr:first-child > th {
      border-bottom: 0;
      }
      .panel > .table-bordered > tbody > tr:last-child > td,
      .panel > .table-responsive > .table-bordered > tbody > tr:last-child > td,
      .panel > .table-bordered > tfoot > tr:last-child > td,
      .panel > .table-responsive > .table-bordered > tfoot > tr:last-child > td,
      .panel > .table-bordered > tbody > tr:last-child > th,
      .panel > .table-responsive > .table-bordered > tbody > tr:last-child > th,
      .panel > .table-bordered > tfoot > tr:last-child > th,
      .panel > .table-responsive > .table-bordered > tfoot > tr:last-child > th {
      border-bottom: 0;
      }
      .panel > .table-responsive {
      margin-bottom: 0;
      border: 0;
      }
      .panel-group {
      margin-bottom: 20px;
      }
      .panel-group .panel {
      margin-bottom: 0;
      border-radius: 4px;
      }
      .panel-group .panel + .panel {
      margin-top: 5px;
      }
      .panel-group .panel-heading {
      border-bottom: 0;
      }
      .panel-group .panel-heading + .panel-collapse > .panel-body,
      .panel-group .panel-heading + .panel-collapse > .list-group {
      border-top: 1px solid #dddddd;
      }
      .panel-group .panel-footer {
      border-top: 0;
      }
      .panel-group .panel-footer + .panel-collapse .panel-body {
      border-bottom: 1px solid #dddddd;
      }
      .panel-default {
      border-color: #dddddd;
      }
      .panel-default > .panel-heading {
      color: #333333;
      background-color: #f5f5f5;
      border-color: #dddddd;
      }
      .panel-default > .panel-heading + .panel-collapse > .panel-body {
      border-top-color: #dddddd;
      }
      .panel-default > .panel-heading .badge {
      color: #f5f5f5;
      background-color: #333333;
      }
      .panel-default > .panel-footer + .panel-collapse > .panel-body {
      border-bottom-color: #dddddd;
      }
      .panel-primary {
      border-color: #337ab7;
      }
      .panel-primary > .panel-heading {
      color: #ffffff;
      background-color: #337ab7;
      border-color: #337ab7;
      }
      .panel-primary > .panel-heading + .panel-collapse > .panel-body {
      border-top-color: #337ab7;
      }
      .panel-primary > .panel-heading .badge {
      color: #337ab7;
      background-color: #ffffff;
      }
      .panel-primary > .panel-footer + .panel-collapse > .panel-body {
      border-bottom-color: #337ab7;
      }
      .panel-success {
      border-color: #d6e9c6;
      }
      .panel-success > .panel-heading {
      color: #3c763d;
      background-color: #dff0d8;
      border-color: #d6e9c6;
      }
      .panel-success > .panel-heading + .panel-collapse > .panel-body {
      border-top-color: #d6e9c6;
      }
      .panel-success > .panel-heading .badge {
      color: #dff0d8;
      background-color: #3c763d;
      }
      .panel-success > .panel-footer + .panel-collapse > .panel-body {
      border-bottom-color: #d6e9c6;
      }
      .panel-info {
      border-color: #bce8f1;
      }
      .panel-info > .panel-heading {
      color: #31708f;
      background-color: #d9edf7;
      border-color: #bce8f1;
      }
      .panel-info > .panel-heading + .panel-collapse > .panel-body {
      border-top-color: #bce8f1;
      }
      .panel-info > .panel-heading .badge {
      color: #d9edf7;
      background-color: #31708f;
      }
      .panel-info > .panel-footer + .panel-collapse > .panel-body {
      border-bottom-color: #bce8f1;
      }
      .panel-warning {
      border-color: #faebcc;
      }
      .panel-warning > .panel-heading {
      color: #8a6d3b;
      background-color: #fcf8e3;
      border-color: #faebcc;
      }
      .panel-warning > .panel-heading + .panel-collapse > .panel-body {
      border-top-color: #faebcc;
      }
      .panel-warning > .panel-heading .badge {
      color: #fcf8e3;
      background-color: #8a6d3b;
      }
      .panel-warning > .panel-footer + .panel-collapse > .panel-body {
      border-bottom-color: #faebcc;
      }
      .panel-danger {
      border-color: #ebccd1;
      }
      .panel-danger > .panel-heading {
      color: #a94442;
      background-color: #f2dede;
      border-color: #ebccd1;
      }
      .panel-danger > .panel-heading + .panel-collapse > .panel-body {
      border-top-color: #ebccd1;
      }
      .panel-danger > .panel-heading .badge {
      color: #f2dede;
      background-color: #a94442;
      }
      .panel-danger > .panel-footer + .panel-collapse > .panel-body {
      border-bottom-color: #ebccd1;
      }
      .clearfix:before,
      .clearfix:after,
      .dl-horizontal dd:before,
      .dl-horizontal dd:after,
      .container:before,
      .container:after,
      .container-fluid:before,
      .container-fluid:after,
      .row:before,
      .row:after,
      .panel-body:before,
      .panel-body:after {
      display: table;
      content: " ";
      }
      .clearfix:after,
      .dl-horizontal dd:after,
      .container:after,
      .container-fluid:after,
      .row:after,
      .panel-body:after {
      clear: both;
      }
      .center-block {
      display: block;
      margin-right: auto;
      margin-left: auto;
      }
      .pull-right {
      float: right !important;
      }
      .pull-left {
      float: left !important;
      }
      .hide {
      display: none !important;
      }
      .show {
      display: block !important;
      }
      .invisible {
      visibility: hidden;
      }
      .text-hide {
      font: 0/0 a;
      color: transparent;
      text-shadow: none;
      background-color: transparent;
      border: 0;
      }
      .hidden {
      display: none !important;
      }
      .affix {
      position: fixed;
      }
      @-ms-viewport {
      width: device-width;
      }
      .visible-xs,
      .visible-sm,
      .visible-md,
      .visible-lg {
      display: none !important;
      }
      .visible-xs-block,
      .visible-xs-inline,
      .visible-xs-inline-block,
      .visible-sm-block,
      .visible-sm-inline,
      .visible-sm-inline-block,
      .visible-md-block,
      .visible-md-inline,
      .visible-md-inline-block,
      .visible-lg-block,
      .visible-lg-inline,
      .visible-lg-inline-block {
      display: none !important;
      }
      @media (max-width: 767px) {
      .visible-xs {
      display: block !important;
      }
      table.visible-xs {
      display: table !important;
      }
      tr.visible-xs {
      display: table-row !important;
      }
      th.visible-xs,
      td.visible-xs {
      display: table-cell !important;
      }
      }
      @media (max-width: 767px) {
      .visible-xs-block {
      display: block !important;
      }
      }
      @media (max-width: 767px) {
      .visible-xs-inline {
      display: inline !important;
      }
      }
      @media (max-width: 767px) {
      .visible-xs-inline-block {
      display: inline-block !important;
      }
      }
      @media (min-width: 768px) and (max-width: 991px) {
      .visible-sm {
      display: block !important;
      }
      table.visible-sm {
      display: table !important;
      }
      tr.visible-sm {
      display: table-row !important;
      }
      th.visible-sm,
      td.visible-sm {
      display: table-cell !important;
      }
      }
      @media (min-width: 768px) and (max-width: 991px) {
      .visible-sm-block {
      display: block !important;
      }
      }
      @media (min-width: 768px) and (max-width: 991px) {
      .visible-sm-inline {
      display: inline !important;
      }
      }
      @media (min-width: 768px) and (max-width: 991px) {
      .visible-sm-inline-block {
      display: inline-block !important;
      }
      }
      @media (min-width: 992px) and (max-width: 1199px) {
      .visible-md {
      display: block !important;
      }
      table.visible-md {
      display: table !important;
      }
      tr.visible-md {
      display: table-row !important;
      }
      th.visible-md,
      td.visible-md {
      display: table-cell !important;
      }
      }
      @media (min-width: 992px) and (max-width: 1199px) {
      .visible-md-block {
      display: block !important;
      }
      }
      @media (min-width: 992px) and (max-width: 1199px) {
      .visible-md-inline {
      display: inline !important;
      }
      }
      @media (min-width: 992px) and (max-width: 1199px) {
      .visible-md-inline-block {
      display: inline-block !important;
      }
      }
      @media (min-width: 1200px) {
      .visible-lg {
      display: block !important;
      }
      table.visible-lg {
      display: table !important;
      }
      tr.visible-lg {
      display: table-row !important;
      }
      th.visible-lg,
      td.visible-lg {
      display: table-cell !important;
      }
      }
      @media (min-width: 1200px) {
      .visible-lg-block {
      display: block !important;
      }
      }
      @media (min-width: 1200px) {
      .visible-lg-inline {
      display: inline !important;
      }
      }
      @media (min-width: 1200px) {
      .visible-lg-inline-block {
      display: inline-block !important;
      }
      }
      @media (max-width: 767px) {
      .hidden-xs {
      display: none !important;
      }
      }
      @media (min-width: 768px) and (max-width: 991px) {
      .hidden-sm {
      display: none !important;
      }
      }
      @media (min-width: 992px) and (max-width: 1199px) {
      .hidden-md {
      display: none !important;
      }
      }
      @media (min-width: 1200px) {
      .hidden-lg {
      display: none !important;
      }
      }
      .visible-print {
      display: none !important;
      }
      @media print {
      .visible-print {
      display: block !important;
      }
      table.visible-print {
      display: table !important;
      }
      tr.visible-print {
      display: table-row !important;
      }
      th.visible-print,
      td.visible-print {
      display: table-cell !important;
      }
      }
      .visible-print-block {
      display: none !important;
      }
      @media print {
      .visible-print-block {
      display: block !important;
      }
      }
      .visible-print-inline {
      display: none !important;
      }
      @media print {
      .visible-print-inline {
      display: inline !important;
      }
      }
      .visible-print-inline-block {
      display: none !important;
      }
      @media print {
      .visible-print-inline-block {
      display: inline-block !important;
      }
      }
      @media print {
      .hidden-print {
      display: none !important;
      }
      }




      /*!
      * Bootstrap Modal
      *
      * Copyright Jordan Schroter
      * Licensed under the Apache License v2.0
      * http://www.apache.org/licenses/LICENSE-2.0
      *
      * Boostrap 3 patch for for bootstrap-modal. Include BEFORE bootstrap-modal.css!
      */

      body.modal-open,
      .modal-open .navbar-fixed-top,
      .modal-open .navbar-fixed-bottom {
      margin-right: 0;
      }

      .modal {
      left: 50%;
      bottom: auto;
      right: auto;
      padding: 0;
      width: 500px;
      margin-left: -250px;
      background-color: #ffffff;
      border: 1px solid #999999;
      border: 1px solid rgba(0, 0, 0, 0.2);
      border-radius: 6px;
      -webkit-box-shadow: 0 3px 9px rgba(0, 0, 0, 0.5);
      box-shadow: 0 3px 9px rgba(0, 0, 0, 0.5);
      background-clip: padding-box;
      }

      .modal.container {
      max-width: none;
      }


      /*!
      * Bootstrap Modal
      *
      * Copyright Jordan Schroter
      * Licensed under the Apache License v2.0
      * http://www.apache.org/licenses/LICENSE-2.0
      *
      */

      .modal-open {
      overflow: hidden;
      }


      /* add a scroll bar to stop page from jerking around */
      .modal-open.page-overflow .page-container,
      .modal-open.page-overflow .page-container .navbar-fixed-top,
      .modal-open.page-overflow .page-container .navbar-fixed-bottom,
      .modal-open.page-overflow .modal-scrollable {
      overflow-y: scroll;
      }

      @media (max-width: 979px) {
      .modal-open.page-overflow .page-container .navbar-fixed-top,
      .modal-open.page-overflow .page-container .navbar-fixed-bottom {
      overflow-y: visible;
      }
      }


      .modal-scrollable {
      position: fixed;
      top: 0;
      bottom: 0;
      left: 0;
      right: 0;
      overflow: auto;
      }

      .modal {
      outline: none;
      position: absolute;
      margin-top: 0;
      top: 50%;
      overflow: visible; /* allow content to popup out (i.e tooltips) */
      }

      .modal.fade {
      top: -100%;
      -webkit-transition: opacity 0.3s linear, top 0.3s ease-out, bottom 0.3s ease-out, margin-top 0.3s ease-out;
      -moz-transition: opacity 0.3s linear, top 0.3s ease-out, bottom 0.3s ease-out, margin-top 0.3s ease-out;
      -o-transition: opacity 0.3s linear, top 0.3s ease-out, bottom 0.3s ease-out, margin-top 0.3s ease-out;
      transition: opacity 0.3s linear, top 0.3s ease-out, bottom 0.3s ease-out, margin-top 0.3s ease-out;
      }

      .modal.fade.in {
      top: 50%;
      }

      .modal-body {
      max-height: none;
      overflow: visible;
      }

      .modal.modal-absolute {
      position: absolute;
      z-index: 950;
      }

      .modal .loading-mask {
      position: absolute;
      top: 0;
      bottom: 0;
      left: 0;
      right: 0;
      background: #fff;
      border-radius: 6px;
      }

      .modal-backdrop.modal-absolute{
      position: absolute;
      z-index: 940;
      }

      .modal-backdrop,
      .modal-backdrop.fade.in{
      opacity: 0.7;
      filter: alpha(opacity=70);
      background: #fff;
      }

      .modal.container {
      width: 940px;
      margin-left: -470px;
      }

      /* Modal Overflow */

      .modal-overflow.modal {
      top: 1%;
      }

      .modal-overflow.modal.fade {
      top: -100%;
      }

      .modal-overflow.modal.fade.in {
      top: 1%;
      }

      .modal-overflow .modal-body {
      overflow: auto;
      -webkit-overflow-scrolling: touch;
      }

      /* Responsive */

      @media (min-width: 1200px) {
      .modal.container {
      width: 1170px;
      margin-left: -585px;
      }
      }

      @media (max-width: 979px) {
      .modal,
      .modal.container,
      .modal.modal-overflow {
      top: 1%;
      right: 1%;
      left: 1%;
      bottom: auto;
      width: auto !important;
      height: auto !important;
      margin: 0 !important;
      padding: 0 !important;
      }

      .modal.fade.in,
      .modal.container.fade.in,
      .modal.modal-overflow.fade.in {
      top: 1%;
      bottom: auto;
      }

      .modal-body,
      .modal-overflow .modal-body {
      position: static;
      margin: 0;
      height: auto !important;
      max-height: none !important;
      overflow: visible !important;
      }

      .modal-footer,
      .modal-overflow .modal-footer {
      position: static;
      }
      }

      .loading-spinner {
      position: absolute;
      top: 50%;
      left: 50%;
      margin: -12px 0 0 -12px;
      }


    </style>


    <!--
    <xsl:text disable-output-escaping='yes'>&lt;!DOCTYPE html&gt;</xsl:text>    
      <html>
      <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
          <xsl:value-of select="''"/>
        </link>
        <script src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
            crossorigin="anonymous">
          <xsl:value-of select="''"/>
        </script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">
          <xsl:value-of select="''"/>
        </script>
      </head>
      <body>
      -->

    <div class="containerOLD" style="width:100%;">

      <!-- ################ DEFINIZIONE VARIABILI USATE INTERNAMENTE ################# -->
      <xsl:variable name="myPECDestinatario">
        <xsl:for-each select="a:FatturaElettronica/FatturaElettronicaHeader/DatiTrasmissione">

          <xsl:choose>
            <xsl:when test="PECDestinatario">
              <xsl:value-of select="PECDestinatario" />
            </xsl:when>
            <xsl:otherwise>no-PECDestinatario</xsl:otherwise>
          </xsl:choose>

        </xsl:for-each>
      </xsl:variable>

      <xsl:variable name="myCodiceDestinatario">
        <xsl:for-each select="a:FatturaElettronica/FatturaElettronicaHeader/DatiTrasmissione">

          <xsl:choose>
            <xsl:when test="CodiceDestinatario">
              <xsl:value-of select="CodiceDestinatario" />
            </xsl:when>
            <xsl:otherwise>no-CodiceDestinatario</xsl:otherwise>
          </xsl:choose>

        </xsl:for-each>
      </xsl:variable>




      <xsl:variable name="myImportoPagamento">
        <xsl:for-each select="a:FatturaElettronica/FatturaElettronicaBody/DatiPagamento/DettaglioPagamento">

          <xsl:choose>
            <xsl:when test="ImportoPagamento">
              <xsl:value-of select="ImportoPagamento" />
            </xsl:when>
            <xsl:otherwise>0</xsl:otherwise>
          </xsl:choose>

        </xsl:for-each>
      </xsl:variable>


      <xsl:variable name="myImportoTotaleDocumento">
        <xsl:for-each select="a:FatturaElettronica/FatturaElettronicaBody/DatiGenerali/DatiGeneraliDocumento">

          <xsl:choose>
            <xsl:when test="ImportoTotaleDocumento">
              <xsl:value-of select="ImportoTotaleDocumento" />
            </xsl:when>
            <xsl:otherwise>0</xsl:otherwise>
          </xsl:choose>

        </xsl:for-each>
      </xsl:variable>
      
      <!-- ################ /DEFINIZIONE VARIABILI USATE INTERNAMENTE ################# -->


      <!--INIZIO DATI HEADER-->
      <xsl:if test="a:FatturaElettronica">

        <xsl:if test="a:FatturaElettronica/FatturaElettronicaHeader">

          <div class="row">
            <div class="col-xs-6 col-sm-8 col-md-8 col-lg-8">
              <h2>FATTURA ELETTRONICA</h2>
              <!--<small>
                    Versione <xsl:value-of select="a:FatturaElettronica/@versione"/>
                  </small>-->
            </div>


            <!--INIZIO DATI DELLA TRASMISSIONE-->
            <xsl:if test="a:FatturaElettronica/FatturaElettronicaHeader/DatiTrasmissione">

              <div class="col-xs-6 col-sm-4 col-md-4 col-lg-4">

                <xsl:for-each select="a:FatturaElettronica/FatturaElettronicaHeader/DatiTrasmissione">

                  <p class="text-right">

                    <!--
                      <xsl:if test="IdTrasmittente">
                        Identificativo del trasmittente:
                        <span>
                          <xsl:value-of select="IdTrasmittente/IdPaese" />
                          <xsl:value-of select="IdTrasmittente/IdCodice" />
                        </span>
                        <br />
                      </xsl:if>
                      
                      <xsl:if test="ProgressivoInvio">
                        Progressivo di invio:
                        <span>
                          <xsl:value-of select="ProgressivoInvio" />
                        </span>
                        <br />
                      </xsl:if>
                      -->

                    <xsl:if test="FormatoTrasmissione">
                      <br />Copia di cortesia (formato
                      <span>
                        <xsl:value-of select="FormatoTrasmissione" />
                      </span>)

                    </xsl:if>

                    <!--
                      <xsl:if test="CodiceDestinatario">
                        Codice identificativo destinatario:
                        <span>
                          <xsl:value-of select="CodiceDestinatario" />
                        </span>
                        <br />
                      </xsl:if>
                                            
                      <xsl:if test="ContattiTrasmittente/Telefono">
                        Telefono del trasmittente:
                        <span>
                          <xsl:value-of select="ContattiTrasmittente/Telefono" />
                        </span>
                        <br />
                      </xsl:if>
                      
                      <xsl:if test="ContattiTrasmittente/Email">
                        E-mail del trasmittente:
                        <span>
                          <xsl:value-of select="ContattiTrasmittente/Email" />
                        </span>
                        <br />
                      </xsl:if>
                      
                      <xsl:if test="PECDestinatario">
                        Destinatario PEC:
                        <span>
                          <xsl:value-of select="PECDestinatario" />
                        </span>
                        <br />
                      </xsl:if>
                      -->
                  </p>

                </xsl:for-each>

              </div>

            </xsl:if>
            <!--FINE DATI DELLA TRASMISSIONE-->

          </div>




        </xsl:if>
        <!--/ FatturaElettronica/FatturaElettronicaHeader-->

        <xsl:for-each select="a:FatturaElettronica/FatturaElettronicaBody">
          <xsl:if test="DatiGenerali/DatiGeneraliDocumento">
            <div class="row">
              <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <!--INIZIO DATI GENERALI DOCUMENTO-->
                <div class="panel panel-primary">
                  <div class="panel-heading">
                    <h3 class="panel-title">Documento</h3>
                  </div>
                  <div class="panel-body">
                    <xsl:if test="DatiGenerali/DatiGeneraliDocumento/TipoDocumento">

                      Tipologia documento:
                      <span>
                        <xsl:value-of select="DatiGenerali/DatiGeneraliDocumento/TipoDocumento" />
                      </span>
                      <xsl:variable name="TD">
                        <xsl:value-of select="DatiGenerali/DatiGeneraliDocumento/TipoDocumento" />
                      </xsl:variable>
                      <xsl:choose>
                        <xsl:when test="$TD='TD01'">
                          (fattura)
                        </xsl:when>
                        <xsl:when test="$TD='TD02'">
                          (acconto/anticipo su fattura)
                        </xsl:when>
                        <xsl:when test="$TD='TD03'">
                          (acconto/anticipo su parcella)
                        </xsl:when>
                        <xsl:when test="$TD='TD04'">
                          (nota di credito)
                        </xsl:when>
                        <xsl:when test="$TD='TD05'">
                          (nota di debito)
                        </xsl:when>
                        <xsl:when test="$TD='TD06'">
                          (parcella)
                        </xsl:when>


                        <xsl:when test="$TD='TD16'">
                          (integrazione fattura reverse charge interno)
                        </xsl:when>
                        <xsl:when test="$TD='TD17'">
                          (integrazione/autofattura per acquisto servizi dall'estero)
                        </xsl:when>
                        <xsl:when test="$TD='TD18'">
                          (integrazione per acquisto di beni intracomunitari)
                        </xsl:when>
                        <xsl:when test="$TD='TD19'">
                          (integrazione/autofattura per acquisto di beni)
                        </xsl:when>
                        <xsl:when test="$TD='TD20'">
                          (autofattura per regolarizzazione e integrazione delle fatture)
                        </xsl:when>
                        <xsl:when test="$TD='TD21'">
                          (autofattura per splafonamento)
                        </xsl:when>
                        <xsl:when test="$TD='TD22'">
                          (estrazione beni da Deposito IVA)
                        </xsl:when>
                        <xsl:when test="$TD='TD23'">
                          (estrazione beni da Deposito IVA con versamento IVA)
                        </xsl:when>
                        <xsl:when test="$TD='TD24'">
                          (fattura differita art.21 comma 4,lett.a)
                        </xsl:when>
                        <xsl:when test="$TD='TD25'">
                          (fattura differita art.21 comma 4,terzo periodo lett.b)
                        </xsl:when>
                        <xsl:when test="$TD='TD26'">
                          (cessione di beni ammortizzabili e per passaggi interni)
                        </xsl:when>
                        <xsl:when test="$TD='TD27'">
                          (fattura per autoconsumo o per cessioni gratuite senza rivalsa)
                        </xsl:when>


                        <xsl:when test="$TD=''">
                        </xsl:when>
                        <xsl:otherwise>
                          <span>(!!! codice non previsto !!!)</span>
                        </xsl:otherwise>
                      </xsl:choose>
                      <br />
                    </xsl:if>


                    <xsl:if test="DatiGenerali/DatiGeneraliDocumento/Data">
                      Data documento:
                      <span>
                        <xsl:value-of select="DatiGenerali/DatiGeneraliDocumento/Data" />
                      </span>
                      <xsl:call-template name="FormatDate">
                        <xsl:with-param name="DateTime" select="DatiGenerali/DatiGeneraliDocumento/Data" />
                      </xsl:call-template>
                      <br />
                    </xsl:if>

                    <xsl:if test="DatiGenerali/DatiGeneraliDocumento/Numero">
                      Numero documento:
                      <span>
                        <xsl:value-of select="DatiGenerali/DatiGeneraliDocumento/Numero" />
                      </span>
                      <br />
                    </xsl:if>

                    <!--
                    <xsl:if test="DatiGenerali/DatiGeneraliDocumento/ImportoTotaleDocumento">
                      Importo totale documento:
                      <span>
                        <xsl:value-of select="DatiGenerali/DatiGeneraliDocumento/ImportoTotaleDocumento" />
                      </span>
                      <br />
                    </xsl:if>
                    -->
                    <xsl:if test="$myImportoPagamento != $myImportoTotaleDocumento">
                      Importo totale documento:
                      <span>
                        <xsl:value-of select="DatiGenerali/DatiGeneraliDocumento/ImportoTotaleDocumento" />
                      </span>
                      <br />
                    </xsl:if>

                    <xsl:if test="DatiGenerali/DatiGeneraliDocumento/Arrotondamento">
                      Arrotondamento su Importo totale documento:
                      <span>
                        <xsl:value-of select="DatiGenerali/DatiGeneraliDocumento/Arrotondamento" />
                      </span>
                      <br />
                    </xsl:if>

                    <xsl:for-each select="DatiGenerali/DatiGeneraliDocumento/Causale">
                      Causale:
                      <span>
                        <xsl:value-of select="current()" />
                        <!--<xsl:value-of select="DatiGenerali/DatiGeneraliDocumento/Causale" />-->
                      </span>
                      <br />
                    </xsl:for-each>

                    <xsl:if test="DatiGenerali/DatiGeneraliDocumento/Art73">
                      Art. 73 DPR 633/72:
                      <span>
                        <xsl:value-of select="DatiGenerali/DatiGeneraliDocumento/Art73" />
                      </span>
                      <br />
                    </xsl:if>

                    <xsl:if test="DatiGenerali/DatiGeneraliDocumento/Divisa">
                      Valuta importi:
                      <span>
                        <xsl:value-of select="DatiGenerali/DatiGeneraliDocumento/Divisa" />
                      </span>
                      <br />
                    </xsl:if>

                  </div>
                </div>
                <!--FINE DATI GENERALI DOCUMENTO-->
              </div>
            </div>
          </xsl:if>
        </xsl:for-each>


        <xsl:if test="a:FatturaElettronica/FatturaElettronicaHeader">

          <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
              <div class="row">

                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                  <!--INIZIO DATI CEDENTE PRESTATORE-->
                  <xsl:if test="a:FatturaElettronica/FatturaElettronicaHeader/CedentePrestatore">

                    <div class="panel panel-primary">
                      <div class="panel-heading">
                        <h3 class="panel-title">Fornitore (cedente/prestatore)</h3>
                      </div>
                      <div class="panel-body">

                        <xsl:if test="a:FatturaElettronica/FatturaElettronicaHeader/CedentePrestatore/DatiAnagrafici">
                          <!--<h4>Dati anagrafici</h4>-->

                          <xsl:for-each select="a:FatturaElettronica/FatturaElettronicaHeader/CedentePrestatore/DatiAnagrafici">

                            <xsl:if test="Anagrafica/Denominazione">
                              <!--Denominazione:-->
                              <span>
                                <xsl:value-of select="Anagrafica/Denominazione" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="Anagrafica/Nome">
                              Nome:
                              <span>
                                <xsl:value-of select="Anagrafica/Nome" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="Anagrafica/Cognome">
                              Cognome:
                              <span>
                                <xsl:value-of select="Anagrafica/Cognome" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="Anagrafica/Titolo">
                              Titolo:
                              <span>
                                <xsl:value-of select="Anagrafica/Titolo" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="Anagrafica/CodEORI">
                              Codice EORI:
                              <span>
                                <xsl:value-of select="Anagrafica/CodEORI" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="IdFiscaleIVA">
                              P.IVA:
                              <span>
                                <xsl:value-of select="IdFiscaleIVA/IdPaese" />
                                <xsl:value-of select="IdFiscaleIVA/IdCodice" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="CodiceFiscale">
                              COD.FISC.:
                              <span>
                                <xsl:value-of select="CodiceFiscale" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="AlboProfessionale">
                              Albo professionale di appartenenza:
                              <span>
                                <xsl:value-of select="AlboProfessionale" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="ProvinciaAlbo">
                              Provincia di competenza dell'Albo:
                              <span>
                                <xsl:value-of select="ProvinciaAlbo" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="NumeroIscrizioneAlbo">
                              Numero iscrizione all'Albo:
                              <span>
                                <xsl:value-of select="NumeroIscrizioneAlbo" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="DataIscrizioneAlbo">
                              Data iscrizione all'Albo:
                              <span>
                                <xsl:value-of select="DataIscrizioneAlbo" />
                              </span>
                              <xsl:call-template name="FormatDate">
                                <xsl:with-param name="DateTime" select="DataIscrizioneAlbo" />
                              </xsl:call-template>
                              <br />
                            </xsl:if>

                            <!--
                                <xsl:if test="RegimeFiscale">
                                  Regime fiscale:
                                  <span>
                                    <xsl:value-of select="RegimeFiscale" />
                                  </span>
                                  <xsl:variable name="RF">
                                    <xsl:value-of select="RegimeFiscale" />
                                  </xsl:variable>
                                  <xsl:choose>
                                    <xsl:when test="$RF='RF01'">
                                      (ordinario)
                                    </xsl:when>
                                    <xsl:when test="$RF='RF02'">
                                      (contribuenti minimi)
                                    </xsl:when>
                                    <xsl:when test="$RF='RF03'">
                                      (nuove iniziative produttive) - Non più valido in quanto abrogato dalla legge di stabilità 2015
                                    </xsl:when>
                                    <xsl:when test="$RF='RF04'">
                                      (agricoltura e attività connesse e pesca)
                                    </xsl:when>
                                    <xsl:when test="$RF='RF05'">
                                      (vendita sali e tabacchi)
                                    </xsl:when>
                                    <xsl:when test="$RF='RF06'">
                                      (commercio fiammiferi)
                                    </xsl:when>
                                    <xsl:when test="$RF='RF07'">
                                      (editoria)
                                    </xsl:when>
                                    <xsl:when test="$RF='RF08'">
                                      (gestione servizi telefonia pubblica)
                                    </xsl:when>
                                    <xsl:when test="$RF='RF09'">
                                      (rivendita documenti di trasporto pubblico e di sosta)
                                    </xsl:when>
                                    <xsl:when test="$RF='RF10'">
                                      (intrattenimenti, giochi e altre attività di cui alla tariffa allegata al DPR 640/72)
                                    </xsl:when>
                                    <xsl:when test="$RF='RF11'">
                                      (agenzie viaggi e turismo)
                                    </xsl:when>
                                    <xsl:when test="$RF='RF12'">
                                      (agriturismo)
                                    </xsl:when>
                                    <xsl:when test="$RF='RF13'">
                                      (vendite a domicilio)
                                    </xsl:when>
                                    <xsl:when test="$RF='RF14'">
                                      (rivendita beni usati, oggetti d’arte,
                                      d’antiquariato o da collezione)
                                    </xsl:when>
                                    <xsl:when test="$RF='RF15'">
                                      (agenzie di vendite all’asta di oggetti d’arte,
                                      antiquariato o da collezione)
                                    </xsl:when>
                                    <xsl:when test="$RF='RF16'">
                                      (IVA per cassa P.A.)
                                    </xsl:when>
                                    <xsl:when test="$RF='RF17'">
                                      (IVA per cassa - art. 32-bis, D.L. 83/2012)
                                    </xsl:when>
                                    <xsl:when test="$RF='RF19'">
                                      (Regime forfettario)
                                    </xsl:when>
                                    <xsl:when test="$RF='RF18'">
                                      (altro)
                                    </xsl:when>
                                    <xsl:when test="$RF='RF19'">
                                      (Regime forfettario)
                                    </xsl:when>
                                    <xsl:when test="$RF=''">
                                    </xsl:when>
                                    <xsl:otherwise>
                                      <span>(!!! codice non previsto !!!)</span>
                                    </xsl:otherwise>
                                  </xsl:choose>
                                  <br />
                                </xsl:if>
-->

                          </xsl:for-each>

                        </xsl:if>

                        <xsl:if test="a:FatturaElettronica/FatturaElettronicaHeader/CedentePrestatore/Sede">
                          <!-- <h4>Dati della sede</h4> -->

                          <xsl:for-each select="a:FatturaElettronica/FatturaElettronicaHeader/CedentePrestatore/Sede">

                            <xsl:if test="Indirizzo">
                              <!-- Indirizzo:-->
                              <span>
                                <xsl:value-of select="Indirizzo" />
                              </span>
                              <!--<br />-->
                            </xsl:if>

                            <!--
                                <xsl:if test="NumeroCivico">
                                  Numero civico:
                                  <span>
                                    <xsl:value-of select="NumeroCivico" />
                                  </span>
                                  <br />
                                </xsl:if>
                                -->

                            <!-- ####### nume civico in linea con indirizzo ######### -->
                            <xsl:choose>
                              <xsl:when test="NumeroCivico">
                                <span>
                                  <xsl:value-of select="concat(' ', NumeroCivico)" />
                                </span>
                                <br />
                              </xsl:when>
                              <xsl:otherwise>
                                <br />
                              </xsl:otherwise>
                            </xsl:choose>
                            <!-- ####### nume civico in linea con indirizzo ######### -->

                            <xsl:if test="CAP">
                              <!--CAP-->
                              <span>
                                <xsl:value-of select="CAP" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="Comune">
                              <!--Comune:-->
                              <span>
                                <xsl:value-of select="Comune" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="Provincia">
                              <!--Provincia:-->
                              <span>
                                (<xsl:value-of select="Provincia" />)
                              </span>
                              <br />
                            </xsl:if>

                            <!--
                                <xsl:if test="Nazione">
                                  Nazione:
                                  <span>
                                    <xsl:value-of select="Nazione" />
                                  </span>
                                  <br />
                                </xsl:if>
                              -->

                          </xsl:for-each>

                        </xsl:if>

                        <xsl:if test="a:FatturaElettronica/FatturaElettronicaHeader/CedentePrestatore/StabileOrganizzazione">
                          <h4>Dati della stabile organizzazione</h4>

                          <xsl:for-each select="a:FatturaElettronica/FatturaElettronicaHeader/CedentePrestatore/StabileOrganizzazione">
                            <xsl:if test="Indirizzo">

                              Indirizzo:
                              <span>
                                <xsl:value-of select="Indirizzo" />
                              </span>
                              <br />
                            </xsl:if>
                            <xsl:if test="NumeroCivico">

                              Numero civico:
                              <span>
                                <xsl:value-of select="NumeroCivico" />
                              </span>
                              <br />
                            </xsl:if>
                            <xsl:if test="CAP">

                              CAP:
                              <span>
                                <xsl:value-of select="CAP" />
                              </span>
                              <br />
                            </xsl:if>
                            <xsl:if test="Comune">

                              Comune:
                              <span>
                                <xsl:value-of select="Comune" />
                              </span>
                              <br />
                            </xsl:if>
                            <xsl:if test="Provincia">

                              Provincia:
                              <span>
                                <xsl:value-of select="Provincia" />
                              </span>
                              <br />
                            </xsl:if>
                            <xsl:if test="Nazione">

                              Nazione:
                              <span>
                                <xsl:value-of select="Nazione" />
                              </span>
                              <br />
                            </xsl:if>
                          </xsl:for-each>

                        </xsl:if>


                        <!--
                            <xsl:if test="a:FatturaElettronica/FatturaElettronicaHeader/CedentePrestatore/IscrizioneREA">
                              <h4>Dati di iscrizione nel registro delle imprese</h4>

                              <xsl:for-each select="a:FatturaElettronica/FatturaElettronicaHeader/CedentePrestatore/IscrizioneREA">
                                <xsl:if test="Ufficio">

                                  Provincia Ufficio Registro Imprese:
                                  <span>
                                    <xsl:value-of select="Ufficio" />
                                  </span>
                                  <br />
                                </xsl:if>
                                <xsl:if test="NumeroREA">

                                  Numero di iscrizione:
                                  <span>
                                    <xsl:value-of select="NumeroREA" />
                                  </span>
                                  <br />
                                </xsl:if>
                                <xsl:if test="CapitaleSociale">

                                  Capitale sociale:
                                  <span>
                                    <xsl:value-of select="CapitaleSociale" />
                                  </span>
                                  <br />
                                </xsl:if>
                                <xsl:if test="SocioUnico">

                                  Numero soci:
                                  <span>
                                    <xsl:value-of select="SocioUnico" />
                                  </span>

                                  <xsl:variable name="NS">
                                    <xsl:value-of select="SocioUnico" />
                                  </xsl:variable>
                                  <xsl:choose>
                                    <xsl:when test="$NS='SU'">
                                      (socio unico)
                                    </xsl:when>
                                    <xsl:when test="$NS='SM'">
                                      (più soci)
                                    </xsl:when>
                                    <xsl:when test="$NS=''">
                                    </xsl:when>
                                    <xsl:otherwise>
                                      <span>(!!! codice non previsto !!!)</span>
                                    </xsl:otherwise>
                                  </xsl:choose>
                                  <br />
                                </xsl:if>
                                <xsl:if test="StatoLiquidazione">

                                  Stato di liquidazione:
                                  <span>
                                    <xsl:value-of select="StatoLiquidazione" />
                                  </span>

                                  <xsl:variable name="SL">
                                    <xsl:value-of select="StatoLiquidazione" />
                                  </xsl:variable>
                                  <xsl:choose>
                                    <xsl:when test="$SL='LS'">
                                      (in liquidazione)
                                    </xsl:when>
                                    <xsl:when test="$SL='LN'">
                                      (non in liquidazione)
                                    </xsl:when>
                                    <xsl:when test="$SL=''">
                                    </xsl:when>
                                    <xsl:otherwise>
                                      <span>(!!! codice non previsto !!!)</span>
                                    </xsl:otherwise>
                                  </xsl:choose>
                                  <br />
                                </xsl:if>
                              </xsl:for-each>

                            </xsl:if>

                            <xsl:for-each select="a:FatturaElettronica/FatturaElettronicaHeader/CedentePrestatore/Contatti">
                              <xsl:if test="Telefono or Fax or Email">
                                <h4>Recapiti</h4>

                                <xsl:if test="Telefono">

                                  Telefono:
                                  <span>
                                    <xsl:value-of select="Telefono" />
                                  </span>
                                  <br />
                                </xsl:if>
                                <xsl:if test="Fax">

                                  Fax:
                                  <span>
                                    <xsl:value-of select="Fax" />
                                  </span>
                                  <br />
                                </xsl:if>
                                <xsl:if test="Email">

                                  E-mail:
                                  <span>
                                    <xsl:value-of select="Email" />
                                  </span>
                                  <br />
                                </xsl:if>

                              </xsl:if>
                            </xsl:for-each>
-->

                        <xsl:if test="a:FatturaElettronica/FatturaElettronicaHeader/CedentePrestatore/RiferimentoAmministrazione">
                          <!--<h4>Riferimento amministrativo</h4>-->
                          Riferimento amministrativo:
                          <span>
                            <xsl:value-of select="a:FatturaElettronica/FatturaElettronicaHeader/CedentePrestatore/RiferimentoAmministrazione" />
                          </span>
                          <br />
                        </xsl:if>

                      </div>
                    </div>

                  </xsl:if>
                  <!--FINE DATI CEDENTE PRESTATORE-->
                </div>


                <div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
                  <!--INIZIO DATI CESSIONARIO COMMITTENTE-->
                  <xsl:if test="a:FatturaElettronica/FatturaElettronicaHeader/CessionarioCommittente">
                    <div class="panel panel-primary">

                      <div class="panel-heading">
                        <h3 class="panel-title">Cliente (cessionario/committente)</h3>
                      </div>
                      <div class="panel-body">

                        <xsl:if test="a:FatturaElettronica/FatturaElettronicaHeader/CessionarioCommittente/DatiAnagrafici">
                          <!--<h4>Dati anagrafici</h4>-->

                          <xsl:for-each select="a:FatturaElettronica/FatturaElettronicaHeader/CessionarioCommittente/DatiAnagrafici">



                            <xsl:if test="Anagrafica/Denominazione">
                              <!--Denominazione:-->
                              <span>
                                <xsl:value-of select="Anagrafica/Denominazione" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="Anagrafica/Nome">
                              Nome:
                              <span>
                                <xsl:value-of select="Anagrafica/Nome" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="Anagrafica/Cognome">
                              Cognome:
                              <span>
                                <xsl:value-of select="Anagrafica/Cognome" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="Anagrafica/Titolo">
                              <!-- Titolo onorifico: -->
                              <span>
                                <xsl:value-of select="Anagrafica/Titolo" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="Anagrafica/CodEORI">
                              Codice EORI:
                              <span>
                                <xsl:value-of select="Anagrafica/CodEORI" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="IdFiscaleIVA">
                              P.IVA:
                              <span>
                                <xsl:value-of select="IdFiscaleIVA/IdPaese" />
                                <xsl:value-of select="IdFiscaleIVA/IdCodice" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="CodiceFiscale">
                              COD.FISC.:
                              <span>
                                <xsl:value-of select="CodiceFiscale" />
                              </span>
                              <br />
                            </xsl:if>

                          </xsl:for-each>

                        </xsl:if>

                        <xsl:if test="a:FatturaElettronica/FatturaElettronicaHeader/CessionarioCommittente/Sede">
                          <!--<h4>Dati della sede</h4>-->

                          <xsl:for-each select="a:FatturaElettronica/FatturaElettronicaHeader/CessionarioCommittente/Sede">

                            <xsl:if test="Indirizzo">
                              <!--Indirizzo:-->
                              <span>
                                <xsl:value-of select="Indirizzo" />
                              </span>
                              <!--<br />-->
                            </xsl:if>

                            <!--
                                <xsl:if test="NumeroCivico">
                                  Numero civico:
                                  <span>
                                    <xsl:value-of select="NumeroCivico" />
                                  </span>
                                  <br />
                                </xsl:if>
                                -->

                            <!-- ####### nume civico in linea con indirizzo ######### -->
                            <xsl:choose>
                              <xsl:when test="NumeroCivico">
                                <span>
                                  <xsl:value-of select="concat(' ', NumeroCivico)" />
                                </span>
                                <br />
                              </xsl:when>
                              <xsl:otherwise>
                                <br />
                              </xsl:otherwise>
                            </xsl:choose>
                            <!-- ####### nume civico in linea con indirizzo ######### -->

                            <xsl:if test="CAP">
                              <!--CAP-->
                              <span>
                                <xsl:value-of select="CAP" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="Comune">
                              <!--Comune:-->
                              <span>
                                <xsl:value-of select="Comune" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="Provincia">
                              <!-- Provincia: -->
                              <span>
                                (<xsl:value-of select="Provincia" />)
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="Nazione">
                              <!--Nazione:-->
                              <xsl:if test="categoryName != 'IT'">
                                <span>
                                  <xsl:value-of select="Nazione" />
                                </span>
                                <br />
                              </xsl:if>
                            </xsl:if>

                          </xsl:for-each>

                        </xsl:if>


                        <xsl:if test="$myPECDestinatario != 'no-PECDestinatario'">
                          PEC:
                          <span>
                            <xsl:value-of select="concat(' ', $myPECDestinatario)" />
                          </span>
                          <br />
                        </xsl:if>

                        <xsl:if test="$myCodiceDestinatario != 'no-CodiceDestinatario'">
                          <xsl:if test="$myCodiceDestinatario != '0000000'">
                            Codice Destinatario:
                            <span>
                              <xsl:value-of select="concat(' ', $myCodiceDestinatario)" />
                            </span>
                            <br />
                          </xsl:if>
                        </xsl:if>


                        <!--
                            <xsl:if test="a:FatturaElettronica/FatturaElettronicaHeader/CessionarioCommittente/StabileOrganizzazione">
                              <h4>Stabile organizzazione del cessionario / committente</h4>

                              <xsl:for-each select="a:FatturaElettronica/FatturaElettronicaHeader/CessionarioCommittente/StabileOrganizzazione">
                                <xsl:if test="Indirizzo">

                                  Indirizzo:
                                  <span>
                                    <xsl:value-of select="Indirizzo" />
                                  </span>
                                  <br />
                                </xsl:if>
                                <xsl:if test="NumeroCivico">

                                  Numero civico:
                                  <span>
                                    <xsl:value-of select="NumeroCivico" />
                                  </span>
                                  <br />
                                </xsl:if>
                                <xsl:if test="CAP">

                                  CAP:
                                  <span>
                                    <xsl:value-of select="CAP" />
                                  </span>
                                  <br />
                                </xsl:if>
                                <xsl:if test="Comune">

                                  Comune:
                                  <span>
                                    <xsl:value-of select="Comune" />
                                  </span>
                                  <br />
                                </xsl:if>
                                <xsl:if test="Provincia">

                                  Provincia:
                                  <span>
                                    <xsl:value-of select="Provincia" />
                                  </span>
                                  <br />
                                </xsl:if>
                                <xsl:if test="Nazione">

                                  Nazione:
                                  <span>
                                    <xsl:value-of select="Nazione" />
                                  </span>
                                  <br />
                                </xsl:if>
                              </xsl:for-each>

                            </xsl:if>

                            <xsl:if test="a:FatturaElettronica/FatturaElettronicaHeader/CessionarioCommittente/RappresentanteFiscale">
                              <div id="rappresentante-fiscale">
                                <h4>Dati del rappresentante fiscale del cessionario / committente</h4>


                                <xsl:for-each select="a:FatturaElettronica/FatturaElettronicaHeader/CessionarioCommittente/RappresentanteFiscale">
                                  <xsl:if test="IdFiscaleIVA">

                                    Identificativo fiscale ai fini IVA:
                                    <span>
                                      <xsl:value-of select="IdFiscaleIVA/IdPaese" />
                                      <xsl:value-of select="IdFiscaleIVA/IdCodice" />
                                    </span>
                                    <br />
                                  </xsl:if>
                                  <xsl:if test="Denominazione">

                                    Denominazione:
                                    <span>
                                      <xsl:value-of select="Denominazione" />
                                    </span>
                                    <br />
                                  </xsl:if>
                                  <xsl:if test="Nome">

                                    Nome:
                                    <span>
                                      <xsl:value-of select="Nome" />
                                    </span>
                                    <br />
                                  </xsl:if>
                                  <xsl:if test="Cognome">

                                    Cognome:
                                    <span>
                                      <xsl:value-of select="Cognome" />
                                    </span>
                                    <br />
                                  </xsl:if>
                                </xsl:for-each>

                              </div>
                            </xsl:if>
  -->

                      </div>

                    </div>
                  </xsl:if>
                  <!--FINE DATI CESSIONARIO COMMITTENTE-->
                </div>

              </div>
            </div>
          </div>
        </xsl:if>
        <!--FINE DATI HEADER-->


        <xsl:for-each select="a:FatturaElettronica/FatturaElettronicaBody">

          <!--INIZIO DATI PAGAMENTO-->
          <xsl:if test="DatiPagamento">
            <div class="row">
              <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                <div class="panel panel-primary">
                  <div class="panel-heading">
                    <h3 class="panel-title">Pagamento</h3>
                  </div>
                  <div class="panel-body">

                    <xsl:for-each select="DatiPagamento">

                      <xsl:if test="DettaglioPagamento">
                        <xsl:for-each select="DettaglioPagamento">
                        <xsl:if test="ImportoPagamento">
                          <!--<br />-->
                          <strong>IMPORTO TOTALE</strong>:<xsl:text> </xsl:text>
                          <strong>
                            <span>
                              <xsl:value-of select="ImportoPagamento" />
                            </span>
                          </strong>
                        </xsl:if>
                        </xsl:for-each>
                      </xsl:if>

                      <xsl:if test="CondizioniPagamento">

                        <br />Condizioni di pagamento:<xsl:text> </xsl:text>
                        <span>
                          <xsl:value-of select="CondizioniPagamento" />
                        </span>
                        <xsl:variable name="CP">
                          <xsl:value-of select="CondizioniPagamento" />
                        </xsl:variable>
                        <xsl:choose>
                          <xsl:when test="$CP='TP01'">
                            (pagamento a rate)
                          </xsl:when>
                          <xsl:when test="$CP='TP02'">
                            (pagamento completo)
                          </xsl:when>
                          <xsl:when test="$CP='TP03'">
                            (anticipo)
                          </xsl:when>
                          <xsl:when test="$CP=''">
                          </xsl:when>
                          <xsl:otherwise>
                            <span>(!!! codice non previsto !!!)</span>
                          </xsl:otherwise>
                        </xsl:choose>

                      </xsl:if>

                      <xsl:if test="DettaglioPagamento">

                        <xsl:for-each select="DettaglioPagamento">


                          <xsl:if test="Beneficiario">
                            <br />Beneficiario del pagamento:<xsl:text> </xsl:text>
                            <span>
                              <xsl:value-of select="Beneficiario" />
                            </span>
                          </xsl:if>

                          <xsl:if test="ModalitaPagamento">
                            <br />Modalità:<xsl:text> </xsl:text>
                            <span>
                              <xsl:value-of select="ModalitaPagamento" />
                            </span>
                            <xsl:variable name="MP">
                              <xsl:value-of select="ModalitaPagamento" />
                            </xsl:variable>
                            <xsl:choose>
                              <xsl:when test="$MP='MP01'">
                                (contanti)
                              </xsl:when>
                              <xsl:when test="$MP='MP02'">
                                (assegno)
                              </xsl:when>
                              <xsl:when test="$MP='MP03'">
                                (assegno circolare)
                              </xsl:when>
                              <xsl:when test="$MP='MP04'">
                                (contanti presso Tesoreria)
                              </xsl:when>
                              <xsl:when test="$MP='MP05'">
                                (bonifico)
                              </xsl:when>
                              <xsl:when test="$MP='MP06'">
                                (vaglia cambiario)
                              </xsl:when>
                              <xsl:when test="$MP='MP07'">
                                (bollettino bancario)
                              </xsl:when>
                              <xsl:when test="$MP='MP08'">
                                (carta di pagamento)
                              </xsl:when>
                              <xsl:when test="$MP='MP09'">
                                (RID)
                              </xsl:when>
                              <xsl:when test="$MP='MP10'">
                                (RID utenze)
                              </xsl:when>
                              <xsl:when test="$MP='MP11'">
                                (RID veloce)
                              </xsl:when>
                              <xsl:when test="$MP='MP12'">
                                (RIBA)
                              </xsl:when>
                              <xsl:when test="$MP='MP13'">
                                (MAV)
                              </xsl:when>
                              <xsl:when test="$MP='MP14'">
                                (quietanza erario)
                              </xsl:when>
                              <xsl:when test="$MP='MP15'">
                                (giroconto su conti di contabilità speciale)
                              </xsl:when>
                              <xsl:when test="$MP='MP16'">
                                (domiciliazione bancaria)
                              </xsl:when>
                              <xsl:when test="$MP='MP17'">
                                (domiciliazione postale)
                              </xsl:when>
                              <xsl:when test="$MP='MP18'">
                                (bollettino di c/c postale)
                              </xsl:when>
                              <xsl:when test="$MP='MP19'">
                                (SEPA Direct Debit)
                              </xsl:when>
                              <xsl:when test="$MP='MP20'">
                                (SEPA Direct Debit CORE)
                              </xsl:when>
                              <xsl:when test="$MP='MP21'">
                                (SEPA Direct Debit B2B)
                              </xsl:when>
                              <xsl:when test="$MP='MP22'">
                                (Trattenuta su somme già riscosse)
                              </xsl:when>
                              <xsl:when test="$MP='MP23'">
                                (PagoPA)
                              </xsl:when>
                              <xsl:when test="$MP=''">
                              </xsl:when>
                              <xsl:otherwise>
                                <span>(!!! codice non previsto !!!)</span>
                              </xsl:otherwise>
                            </xsl:choose>

                          </xsl:if>

                          <xsl:if test="DataRiferimentoTerminiPagamento">
                            <br />Decorrenza termini di pagamento:<xsl:text> </xsl:text>
                            <span>
                              <xsl:value-of select="DataRiferimentoTerminiPagamento" />
                            </span>
                            <xsl:call-template name="FormatDate">
                              <xsl:with-param name="DateTime" select="DataRiferimentoTerminiPagamento" />
                            </xsl:call-template>
                          </xsl:if>

                          <xsl:if test="GiorniTerminiPagamento">
                            <br />Termini di pagamento (in giorni):<xsl:text> </xsl:text>
                            <span>
                              <xsl:value-of select="GiorniTerminiPagamento" />
                            </span>
                          </xsl:if>

                          <xsl:if test="DataScadenzaPagamento">
                            <br />Data scadenza pagamento:<xsl:text> </xsl:text>
                            <span>
                              <xsl:value-of select="DataScadenzaPagamento" />
                            </span>
                            <xsl:call-template name="FormatDate">
                              <xsl:with-param name="DateTime" select="DataScadenzaPagamento" />
                            </xsl:call-template>
                          </xsl:if>

                          <!--
                          <xsl:if test="ImportoPagamento">
                            <br />Importo:<xsl:text> </xsl:text>
                            <span>
                              <xsl:value-of select="ImportoPagamento" />
                            </span>
                          </xsl:if>
                          -->

                          <xsl:if test="CodUfficioPostale">
                            <br />Codice Ufficio Postale:<xsl:text> </xsl:text>
                            <span>
                              <xsl:value-of select="CodUfficioPostale" />
                            </span>
                          </xsl:if>

                          <xsl:if test="CognomeQuietanzante">
                            <br />Cognome del quietanzante:<xsl:text> </xsl:text>
                            <span>
                              <xsl:value-of select="CognomeQuietanzante" />
                            </span>
                          </xsl:if>

                          <xsl:if test="NomeQuietanzante">
                            <br />Nome del quietanzante:<xsl:text> </xsl:text>
                            <span>
                              <xsl:value-of select="NomeQuietanzante" />
                            </span>
                          </xsl:if>

                          <xsl:if test="CFQuietanzante">
                            <br />CF del quietanzante:<xsl:text> </xsl:text>
                            <span>
                              <xsl:value-of select="CFQuietanzante" />
                            </span>
                          </xsl:if>

                          <xsl:if test="TitoloQuietanzante">
                            <br />Titolo del quietanzante:<xsl:text> </xsl:text>
                            <span>
                              <xsl:value-of select="TitoloQuietanzante" />
                            </span>
                          </xsl:if>

                          <xsl:if test="IstitutoFinanziario">
                            <br />Istituto finanziario:<xsl:text> </xsl:text>
                            <span>
                              <xsl:value-of select="IstitutoFinanziario" />
                            </span>
                          </xsl:if>

                          <xsl:if test="IBAN">
                            <br />Codice IBAN:<xsl:text> </xsl:text>
                            <span>
                              <xsl:value-of select="IBAN" />
                            </span>
                          </xsl:if>

                          <xsl:if test="ABI">
                            <br />Codice ABI:<xsl:text> </xsl:text>
                            <span>
                              <xsl:value-of select="ABI" />
                            </span>
                          </xsl:if>

                          <xsl:if test="CAB">
                            <br />Codice CAB:<xsl:text> </xsl:text>
                            <span>
                              <xsl:value-of select="CAB" />
                            </span>
                          </xsl:if>

                          <xsl:if test="BIC">
                            <br />Codice BIC:<xsl:text> </xsl:text>
                            <span>
                              <xsl:value-of select="BIC" />
                            </span>
                          </xsl:if>

                          <xsl:if test="ScontoPagamentoAnticipato">
                            <br />Sconto per pagamento anticipato:<xsl:text> </xsl:text>
                            <span>
                              <xsl:value-of select="ScontoPagamentoAnticipato" />
                            </span>
                          </xsl:if>

                          <xsl:if test="DataLimitePagamentoAnticipato">
                            <br />Data limite per il pagamento anticipato:<xsl:text> </xsl:text>
                            <span>
                              <xsl:value-of select="DataLimitePagamentoAnticipato" />
                            </span>
                            <xsl:call-template name="FormatDate">
                              <xsl:with-param name="DateTime" select="DataLimitePagamentoAnticipato" />
                            </xsl:call-template>
                          </xsl:if>

                          <xsl:if test="PenalitaPagamentiRitardati">
                            <br />Penale per ritardato pagamento:<xsl:text> </xsl:text>
                            <span>
                              <xsl:value-of select="PenalitaPagamentiRitardati" />
                            </span>
                          </xsl:if>

                          <xsl:if test="DataDecorrenzaPenale">
                            <br />Data di decorrenza della penale:<xsl:text> </xsl:text>
                            <span>
                              <xsl:value-of select="DataDecorrenzaPenale" />
                            </span>
                            <xsl:call-template name="FormatDate">
                              <xsl:with-param name="DateTime" select="DataDecorrenzaPenale" />
                            </xsl:call-template>
                          </xsl:if>

                          <xsl:if test="CodicePagamento">
                            <br />Codice pagamento:<xsl:text> </xsl:text>
                            <span>
                              <xsl:value-of select="CodicePagamento" />
                            </span>
                          </xsl:if>

                        </xsl:for-each>
                      </xsl:if>
                    </xsl:for-each>

                  </div>
                </div>

              </div>
            </div>
          </xsl:if>
          <!--FINE DATI PAGAMENTO-->

          <!-- ################ DEFINIZIONE VARIABILI USATE INTERNAMENTE ################# -->
          <xsl:variable name="existsColonnaCodice">
            <xsl:choose>
              <xsl:when test="DatiBeniServizi">
                <xsl:choose>
                  <xsl:when test="DatiBeniServizi/DettaglioLinee">

                    <xsl:for-each select="DatiBeniServizi/DettaglioLinee">
                      <xsl:choose>
                        <xsl:when test="CodiceArticolo">
                          <xsl:value-of select="'s'" />
                        </xsl:when>
                        <xsl:otherwise>
                          <xsl:value-of select="''" />
                        </xsl:otherwise>
                      </xsl:choose>
                    </xsl:for-each>

                  </xsl:when>
                  <xsl:otherwise>
                    <xsl:value-of select="''" />
                  </xsl:otherwise>
                </xsl:choose>
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="''" />
              </xsl:otherwise>
            </xsl:choose>
          </xsl:variable>

          <!--<div class="row">
                                                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                                                  <h1>CodiceArticolo colspan=<xsl:value-of select="$existsColonnaCodice" />;</h1>
                                                </div>
                                            </div> -->

          <!-- la variabile colspanByColonnaCodice2 deve valere sempre 7 oppure 8 -->
          <xsl:variable name="colspanByColonnaCodice2" as="xs:integer">
            <xsl:choose>
              <xsl:when test="contains($existsColonnaCodice,'s')">
                <xsl:value-of select="number(8)" />
              </xsl:when>
              <xsl:otherwise>
                <xsl:value-of select="number(7)" />
              </xsl:otherwise>
            </xsl:choose>
          </xsl:variable>
          <!-- ################ /DEFINIZIONE VARIABILI USATE INTERNAMENTE ################# -->

          <!--INIZIO DATI BENI E SERVIZI-->
          <xsl:if test="DatiBeniServizi">
            <div class="row">
              <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                <div class="panel panel-primary">
                  <div class="panel-heading">
                    <h3 class="panel-title">Beni/Servizi</h3>
                  </div>
                  <div class="panel-body">

                    <!--INIZIO DATI DI DETTAGLIO DELLE LINEE-->
                    <xsl:if test="DatiBeniServizi/DettaglioLinee">

                      <!-- TBL RIGHE -->
                      <table class="table">

                        <tr>
                          <!--<th>linea</th>-->
                          <!--<th>Tipo</th>-->



                          <!--<th>Codice</th>-->
                          <!-- colonna Codice la creo solo se contiene dei dati -->
                          <xsl:if test="$colspanByColonnaCodice2 = 8">
                            <th>Codice</th>
                          </xsl:if>

                          <th>Descr</th>
                          <th>Qta</th>
                          <th>UdM</th>

                          <!--
                                  <xsl:if test="DataInizioPeriodo">  
                                  <th>
                                  Data<br />inizio
                                  </th>
                                  </xsl:if>
                                
                                  <xsl:if test="DataFinePeriodo">   
                                  <th>
                                  Data<br />fine
                                  </th>
                                  </xsl:if>
                                  -->

                          <th>
                            Importo<br />Unitario
                          </th>

                          <th>
                            Sconto
                          </th>

                          <th>
                            Importo<br />Imponibile
                          </th>

                          <th>
                            IVA %
                          </th>

                          <!--
                                  <xsl:if test="Ritenuta"> 
                                  <th>Ritenuta</th>
                                  </xsl:if>
                                  
                                  <xsl:if test="Natura">
                                  <th>Natura</th>
                                  </xsl:if>
                                
                                  <xsl:if test="RiferimentoAmministrazione">   
                                  <th>
                                  Rif.<br />Amm.
                                  </th>
                                  </xsl:if>
                                
                                  <xsl:if test="AltriDatiGestionali">
                                  <th>
                                  Dati<br />Gest.
                                  </th>
                                  </xsl:if>
-->

                        </tr>

                        <xsl:for-each select="DatiBeniServizi/DettaglioLinee">
                          <tr>

                            <!--Nr. linea-->
                            <!--<td>
                                  <span>
                                    <xsl:value-of select="NumeroLinea" />
                                  </span>
                                </td>-->

                            <!--Tipo cessione/prestazione:-->
                            <!--<td>
                                  <xsl:if test="TipoCessionePrestazione">
                                    <span>
                                      <xsl:value-of select="TipoCessionePrestazione" />
                                    </span>
                                    <xsl:variable name="TCP">
                                      <xsl:value-of select="TipoCessionePrestazione" />
                                    </xsl:variable>
                                    <xsl:choose>
                                      <xsl:when test="$TCP='SC'">
                                        (sconto)
                                      </xsl:when>
                                      <xsl:when test="$TCP='PR'">
                                        (premio)
                                      </xsl:when>
                                      <xsl:when test="$TCP='AB'">
                                        (abbuono)
                                      </xsl:when>
                                      <xsl:when test="$TCP='AC'">
                                        (spesa accessoria)
                                      </xsl:when>
                                      <xsl:otherwise>
                                        <span>(!!! codice non previsto !!!)</span>
                                      </xsl:otherwise>
                                    </xsl:choose>
                                  </xsl:if>
                                </td>-->

                            <xsl:if test="$colspanByColonnaCodice2 = 8">
                              <td>
                                <xsl:if test="CodiceArticolo">
                                  <!--<h5>Codifica articolo</h5>-->
                                  <xsl:for-each select="CodiceArticolo">

                                    <xsl:if test="CodiceTipo">
                                      <span>
                                        <xsl:value-of select="CodiceTipo" />:<xsl:text> </xsl:text>
                                      </span>
                                    </xsl:if>

                                    <xsl:if test="CodiceValore">
                                      <span>
                                        <xsl:value-of select="CodiceValore" />
                                      </span>
                                    </xsl:if>

                                  </xsl:for-each>
                                </xsl:if>
                              </td>
                            </xsl:if>

                            <td>
                              <xsl:if test="Descrizione">
                                <span>
                                  <xsl:value-of select="Descrizione" />
                                </span>
                              </xsl:if>
                            </td>

                            <td>
                              <xsl:if test="Quantita">
                                <span>
                                  <xsl:value-of select="Quantita" />
                                </span>
                              </xsl:if>
                            </td>

                            <td>
                              <xsl:if test="UnitaMisura">
                                <span>
                                  <xsl:value-of select="UnitaMisura" />
                                </span>
                              </xsl:if>
                            </td>

                            <td>
                              <xsl:if test="PrezzoUnitario">
                                <span>
                                  <xsl:value-of select="PrezzoUnitario" />
                                </span>
                              </xsl:if>
                            </td>

                            <td>
                              <xsl:if test="ScontoMaggiorazione">

                                <!--<h5>Sconto/Maggiorazione</h5>-->

                                <xsl:for-each select="ScontoMaggiorazione">

                                  <xsl:if test="Tipo">

                                    <span>
                                      <xsl:value-of select="Tipo" />
                                    </span>
                                    <xsl:variable name="TSCM">
                                      <xsl:value-of select="Tipo" />
                                    </xsl:variable>
                                    <xsl:choose>
                                      <xsl:when test="$TSCM='SC'">
                                        sconto
                                      </xsl:when>
                                      <xsl:when test="$TSCM='MG'">
                                        maggiorazione
                                      </xsl:when>
                                      <xsl:otherwise>
                                        <span>(!!! codice non previsto !!!)</span>
                                      </xsl:otherwise>
                                    </xsl:choose>
                                  </xsl:if>
                                  <xsl:if test="Percentuale">
                                    <xsl:text> </xsl:text>%:
                                    <span>
                                      <xsl:text> </xsl:text>
                                      <xsl:value-of select="Percentuale" />
                                    </span>
                                  </xsl:if>
                                  <xsl:if test="Importo">
                                    <xsl:text> </xsl:text>importo:
                                    <span>
                                      <xsl:text> </xsl:text>
                                      <xsl:value-of select="Importo" />
                                    </span>
                                  </xsl:if>

                                </xsl:for-each>
                              </xsl:if>
                            </td>

                            <td>
                              <xsl:if test="PrezzoTotale">
                                <span>
                                  <xsl:value-of select="PrezzoTotale" />
                                </span>
                              </xsl:if>
                            </td>

                            <td>
                              <xsl:if test="AliquotaIVA">
                                <span>
                                  <xsl:value-of select="AliquotaIVA" />
                                </span>
                              </xsl:if>
                            </td>

                          </tr>

                          <xsl:if test="DataInizioPeriodo or DataFinePeriodo or Ritenuta or Natura or RiferimentoAmministrazione or AltriDatiGestionali">

                            <tr>

                              <!-- #### se c'e' la colonna Codice allora colspan=8 #### -->
                              <td colspan="{$colspanByColonnaCodice2}">
                                <!--<xsl:choose>
                                      <xsl:when test="$existsColonnaCodice = 's'">8</xsl:when>                                     
                                      <xsl:otherwise>7</xsl:otherwise>
                                </xsl:choose>-->

                                <xsl:if test="DataInizioPeriodo">
                                  inizio periodo di riferimento:<xsl:text> </xsl:text>
                                  <span>
                                    <xsl:value-of select="DataInizioPeriodo" />
                                  </span>
                                  <xsl:call-template name="FormatDate">
                                    <xsl:with-param name="DateTime" select="DataInizioPeriodo" />
                                  </xsl:call-template>
                                  <br />
                                </xsl:if>

                                <xsl:if test="DataFinePeriodo">
                                  <xsl:text> </xsl:text>fine periodo di riferimento:<xsl:text> </xsl:text>
                                  <span>
                                    <xsl:value-of select="DataFinePeriodo" />
                                  </span>
                                  <xsl:call-template name="FormatDate">
                                    <xsl:with-param name="DateTime" select="DataFinePeriodo" />
                                  </xsl:call-template>
                                  <br />
                                </xsl:if>

                                <xsl:if test="Ritenuta">
                                  <span>
                                    Ritenuta: <xsl:value-of select="Ritenuta" /><br />
                                  </span>
                                </xsl:if>

                                <xsl:if test="Natura">
                                  <span>
                                    Causale Natura: <xsl:value-of select="Natura" />
                                  </span>
                                  <xsl:variable name="NAT">
                                    <xsl:value-of select="Natura" />
                                  </xsl:variable>
                                  <xsl:choose>
                                    <xsl:when test="$NAT='N1'">
                                      (esclusa ex art.15)
                                    </xsl:when>
                                    <xsl:when test="$NAT='N2'">
                                      (non soggetta)
                                    </xsl:when>
                                    <xsl:when test="$NAT='N3'">
                                      (non imponibile)
                                    </xsl:when>
                                    <xsl:when test="$NAT='N4'">
                                      (esente)
                                    </xsl:when>
                                    <xsl:when test="$NAT='N5'">
                                      (regime del margine / IVA non esposta in fattura)
                                    </xsl:when>
                                    <xsl:when test="$NAT='N6'">
                                      (inversione contabile)
                                    </xsl:when>
                                    <xsl:when test="$NAT='N7'">
                                      (IVA assolta in altro Stato UE)
                                    </xsl:when>



                                    <xsl:when test="$NAT='N2.1'">
                                      (non soggette ad IVA artt. da 7 a 7-septies del DPR 633/72)
                                    </xsl:when>
                                    <xsl:when test="$NAT='N2.2'">
                                      (non soggette - altri casi)
                                    </xsl:when>
                                    <xsl:when test="$NAT='N3.1'">
                                      (non imponibili - esportazioni)
                                    </xsl:when>
                                    <xsl:when test="$NAT='N3.2'">
                                      (non imponibili - cessioni intracomunitarie)
                                    </xsl:when>
                                    <xsl:when test="$NAT='N3.3'">
                                      (non imponibili - cessioni verso San Marino)
                                    </xsl:when>
                                    <xsl:when test="$NAT='N3.4'">
                                      (non imponibili - operazioni assimilate alle cessioni all'esportazione)
                                    </xsl:when>
                                    <xsl:when test="$NAT='N3.5'">
                                      (non imponibili - a seguito di dichiarazioni d'intento)
                                    </xsl:when>
                                    <xsl:when test="$NAT='N3.6'">
                                      (non imponibili - altre operazioni che non concorrono alla formaz. del plafond)
                                    </xsl:when>
                                    <xsl:when test="$NAT='N6.1'">
                                      (inversione contabile - cessione di rottami e altri materiali di recupero)
                                    </xsl:when>
                                    <xsl:when test="$NAT='N6.2'">
                                      (inversione contabile - cessione di oro e argento puro)
                                    </xsl:when>
                                    <xsl:when test="$NAT='N6.3'">
                                      (inversione contabile - subappalto nel settore edile)
                                    </xsl:when>
                                    <xsl:when test="$NAT='N6.4'">
                                      (inversione contabile - cessione di fabbricati)
                                    </xsl:when>
                                    <xsl:when test="$NAT='N6.5'">
                                      (inversione contabile - cessione di telefoni cellulari)
                                    </xsl:when>
                                    <xsl:when test="$NAT='N6.6'">
                                      (inversione contabile - cessione di prodotti elettronici)
                                    </xsl:when>
                                    <xsl:when test="$NAT='N6.7'">
                                      (inversione contabile - prestazioni comparto edile e settori connessi)
                                    </xsl:when>
                                    <xsl:when test="$NAT='N6.8'">
                                      (inversione contabile - operazioni settore energetico)
                                    </xsl:when>
                                    <xsl:when test="$NAT='N6.9'">
                                      (inversione contabile - altri casi)
                                    </xsl:when>



                                    <xsl:otherwise>
                                      <span>(!!! codice non previsto !!!)</span>
                                    </xsl:otherwise>
                                  </xsl:choose>
                                  <br />
                                </xsl:if>

                                <xsl:if test="RiferimentoAmministrazione">
                                  Riferimento amministrativo/contabile:
                                  <span>
                                    <xsl:value-of select="RiferimentoAmministrazione" />
                                  </span>
                                  <br />
                                </xsl:if>

                                <xsl:if test="AltriDatiGestionali">
                                  <xsl:for-each select="AltriDatiGestionali">

                                    <span>dati gestionali: </span>
                                    <!-- ### es. TARGA: ABC123XYZ ### -->
                                    <xsl:if test="TipoDato">
                                      <span>
                                        <xsl:value-of select="TipoDato" />:
                                      </span>
                                    </xsl:if>

                                    <xsl:if test="RiferimentoTesto">
                                      <span>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="RiferimentoTesto" />
                                      </span>
                                    </xsl:if>

                                    <xsl:if test="RiferimentoNumero">
                                      <span>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="RiferimentoNumero" />
                                      </span>
                                    </xsl:if>

                                    <xsl:if test="RiferimentoData">
                                      <span>
                                        <xsl:text> </xsl:text>
                                        <xsl:value-of select="RiferimentoData" />
                                      </span>
                                      <xsl:call-template name="FormatDate">
                                        <xsl:with-param name="DateTime" select="RiferimentoData" />
                                      </xsl:call-template>
                                    </xsl:if>
                                    <br />
                                  </xsl:for-each>
                                </xsl:if>


                              </td>
                            </tr>
                          </xsl:if>

                        </xsl:for-each>
                      </table>
                      <!-- /TBL RIGHE -->

                    </xsl:if>
                    <!--FINE DATI DI DETTAGLIO DELLE LINEE-->

                  </div>

                  <div class="panel-footer">

                    <!--INIZIO DATI DI RIEPILOGO ALIQUOTE E NATURE-->
                    <xsl:if test="DatiBeniServizi/DatiRiepilogo">
                      <!--<div id="riepilogo-aliquote-nature">-->
                      <!--<h4>Dati di riepilogo per aliquota IVA e natura</h4>-->
                      <span>Dati di riepilogo per aliquota IVA e natura</span>
                      <span style="font-size:smaller;">
                      <br />
                      <br />
                      </span>
                      <span style="font-size:smaller;">
                        <xsl:for-each select="DatiBeniServizi/DatiRiepilogo">

                          <xsl:if test="AliquotaIVA">
                            Aliquota IVA (%):
                            <span>
                              <xsl:value-of select="AliquotaIVA" />
                            </span>
                            <br />
                          </xsl:if>

                          <xsl:if test="Natura">
                            Natura operazioni:
                            <span>
                              <xsl:value-of select="Natura" />
                            </span>
                            <xsl:variable name="NAT1">
                              <xsl:value-of select="Natura" />
                            </xsl:variable>
                            <xsl:choose>
                              <xsl:when test="$NAT1='N1'">
                                (escluse ex art.15)
                              </xsl:when>
                              <xsl:when test="$NAT1='N2'">
                                (non soggette)
                              </xsl:when>
                              <xsl:when test="$NAT1='N3'">
                                (non imponibili)
                              </xsl:when>
                              <xsl:when test="$NAT1='N4'">
                                (esenti)
                              </xsl:when>
                              <xsl:when test="$NAT1='N5'">
                                (regime del margine / IVA non esposta in fattura)
                              </xsl:when>
                              <xsl:when test="$NAT1='N6'">
                                (inversione contabile)
                              </xsl:when>
                              <xsl:when test="$NAT1='N7'">
                                (IVA assolta in altro Stato UE)
                              </xsl:when>


                              <xsl:when test="$NAT1='N2.1'">
                                (non soggette ad IVA artt. da 7 a 7-septies del DPR 633/72)
                              </xsl:when>
                              <xsl:when test="$NAT1='N2.2'">
                                (non soggette - altri casi)
                              </xsl:when>
                              <xsl:when test="$NAT1='N3.1'">
                                (non imponibili - esportazioni)
                              </xsl:when>
                              <xsl:when test="$NAT1='N3.2'">
                                (non imponibili - cessioni intracomunitarie)
                              </xsl:when>
                              <xsl:when test="$NAT1='N3.3'">
                                (non imponibili - cessioni verso San Marino)
                              </xsl:when>
                              <xsl:when test="$NAT1='N3.4'">
                                (non imponibili - operazioni assimilate alle cessioni all'esportazione)
                              </xsl:when>
                              <xsl:when test="$NAT1='N3.5'">
                                (non imponibili - a seguito di dichiarazioni d'intento)
                              </xsl:when>
                              <xsl:when test="$NAT1='N3.6'">
                                (non imponibili - altre operazioni che non concorrono alla formaz. del plafond)
                              </xsl:when>
                              <xsl:when test="$NAT1='N6.1'">
                                (inversione contabile - cessione di rottami e altri materiali di recupero)
                              </xsl:when>
                              <xsl:when test="$NAT1='N6.2'">
                                (inversione contabile - cessione di oro e argento puro)
                              </xsl:when>
                              <xsl:when test="$NAT1='N6.3'">
                                (inversione contabile - subappalto nel settore edile)
                              </xsl:when>
                              <xsl:when test="$NAT1='N6.4'">
                                (inversione contabile - cessione di fabbricati)
                              </xsl:when>
                              <xsl:when test="$NAT1='N6.5'">
                                (inversione contabile - cessione di telefoni cellulari)
                              </xsl:when>
                              <xsl:when test="$NAT1='N6.6'">
                                (inversione contabile - cessione di prodotti elettronici)
                              </xsl:when>
                              <xsl:when test="$NAT1='N6.7'">
                                (inversione contabile - prestazioni comparto edile e settori connessi)
                              </xsl:when>
                              <xsl:when test="$NAT1='N6.8'">
                                (inversione contabile - operazioni settore energetico)
                              </xsl:when>
                              <xsl:when test="$NAT1='N6.9'">
                                (inversione contabile - altri casi)
                              </xsl:when>


                              <xsl:otherwise>
                                <span> (!!! codice non previsto !!!)</span>
                              </xsl:otherwise>
                            </xsl:choose>
                            <br />
                          </xsl:if>

                          <xsl:if test="SpeseAccessorie">
                            Spese accessorie:
                            <span>
                              <xsl:value-of select="SpeseAccessorie" />
                            </span>
                            <br />
                          </xsl:if>

                          <xsl:if test="Arrotondamento">
                            Arrotondamento:
                            <span>
                              <xsl:value-of select="Arrotondamento" />
                            </span>
                            <br />
                          </xsl:if>

                          <xsl:if test="ImponibileImporto">
                            Imponibile:
                            <span>
                              <xsl:value-of select="ImponibileImporto" />
                            </span>
                            <br />
                          </xsl:if>

                          <xsl:if test="Imposta">
                            Imposta:
                            <span>
                              <xsl:value-of select="Imposta" />
                            </span>
                            <br />
                          </xsl:if>

                          <xsl:if test="EsigibilitaIVA">
                            <span>Esigibilità IVA:</span>
                            <span>
                              <xsl:value-of select="EsigibilitaIVA" />
                            </span>
                            <xsl:variable name="EI">
                              <xsl:value-of select="EsigibilitaIVA" />
                            </xsl:variable>
                            <xsl:choose>
                              <xsl:when test="$EI='I'">
                                (esigibilità immediata)
                              </xsl:when>
                              <xsl:when test="$EI='D'">
                                (esigibilità differita)
                              </xsl:when>
                              <xsl:when test="$EI='S'">
                                (scissione dei pagamenti)
                              </xsl:when>
                              <xsl:otherwise>
                                <span>(!!! codice non previsto !!!)</span>
                              </xsl:otherwise>
                            </xsl:choose>
                            <br />
                            <br />
                          </xsl:if>

                          <xsl:if test="RiferimentoNormativo">

                            Riferimento normativo:
                            <span>
                              <xsl:value-of select="RiferimentoNormativo" />
                            </span>
                            <br />
                          </xsl:if>

                        </xsl:for-each>
                      </span>
                      <!--</div>-->
                    </xsl:if>
                    <!--FINE DATI RIEPILOGO ALIQUOTE E NATURE-->

                  </div>
                </div>

              </div>
            </div>
            <!--</div>-->
          </xsl:if>
          <!--FINE DATI BENI E SERVIZI-->

        </xsl:for-each>


        <!--INIZIO DATI BODY-->
        <xsl:variable name="TOTALBODY">
          <xsl:value-of select="count(a:FatturaElettronica/FatturaElettronicaBody)" />
        </xsl:variable>

        <xsl:for-each select="a:FatturaElettronica/FatturaElettronicaBody">

          <!--<xsl:if test="$TOTALBODY>1">
                <div class="row">
                  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                    <h2>
                      Numero documento nel lotto:
                      <xsl:value-of select="position()" />
                    </h2>
                  </div>
                </div>
              </xsl:if>-->

          <xsl:if test="DatiGenerali/DatiGeneraliDocumento/DatiRitenuta
                  or DatiGenerali/DatiGeneraliDocumento/DatiBollo
                  or DatiGenerali/DatiGeneraliDocumento/DatiCassaPrevidenziale
                  or DatiGenerali/DatiGeneraliDocumento/ScontoMaggiorazione
                  or DatiGenerali/DatiOrdineAcquisto
                  or DatiGenerali/DatiContratto
                  or DatiGenerali/DatiConvenzione
                  or DatiGenerali/DatiRicezione
                  or DatiGenerali/DatiFattureCollegate
                  or DatiGenerali/DatiSAL
                  or DatiGenerali/DatiDDT
                  or DatiGenerali/DatiTrasporto
                  or DatiGenerali/FatturaPrincipale
                  or DatiVeicoli or Allegati">

            <div class="row">
              <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                <div class="panel panel-primary">
                  <div class="panel-heading">
                    <h3 class="panel-title">Altre informazioni</h3>
                  </div>
                  <div class="panel-body">

                    <!--INIZIO DATI GENERALI-->
                    <xsl:if test="DatiGenerali">

                      <xsl:if test="DatiGenerali/DatiGeneraliDocumento">

                        <!--INIZIO DATI DELLA RITENUTA-->
                        <xsl:if test="DatiGenerali/DatiGeneraliDocumento/DatiRitenuta">

                          <xsl:for-each select="DatiGenerali/DatiGeneraliDocumento/DatiRitenuta">
                            <h4>Ritenuta</h4>

                            <xsl:if test="TipoRitenuta">
                              Tipologia ritenuta:
                              <span>
                                <xsl:value-of select="TipoRitenuta" />
                              </span>
                              <xsl:variable name="TR">
                                <xsl:value-of select="TipoRitenuta" />
                              </xsl:variable>
                              <xsl:choose>
                                <xsl:when test="$TR='RT01'">
                                  (ritenuta persone fisiche)
                                </xsl:when>
                                <xsl:when test="$TR='RT02'">
                                  (ritenuta persone giuridiche)
                                </xsl:when>


                                <xsl:when test="$TR='RT03'">
                                  (contributo INPS)
                                </xsl:when>
                                <xsl:when test="$TR='RT04'">
                                  (contributo ENASARCO)
                                </xsl:when>
                                <xsl:when test="$TR='RT05'">
                                  (contributo ENPAM)
                                </xsl:when>
                                <xsl:when test="$TR='RT06'">
                                  (altro contributo previdenziale)
                                </xsl:when>


                                <xsl:when test="$TR=''">
                                </xsl:when>
                                <xsl:otherwise>
                                  <span>(!!! codice non previsto !!!)</span>
                                </xsl:otherwise>
                              </xsl:choose>
                              <br />
                            </xsl:if>

                            <xsl:if test="ImportoRitenuta">
                              Importo ritenuta:
                              <span>
                                <xsl:value-of select="ImportoRitenuta" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="AliquotaRitenuta">
                              Aliquota ritenuta (%):
                              <span>
                                <xsl:value-of select="AliquotaRitenuta" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="CausalePagamento">
                              Causale di pagamento:
                              <span>
                                <xsl:value-of select="CausalePagamento" />
                              </span>
                              <xsl:variable name="CP">
                                <xsl:value-of select="CausalePagamento" />
                              </xsl:variable>
                              <xsl:if test="$CP!=''">
                                (decodifica come da modello 770S)
                              </xsl:if>
                              <br />
                            </xsl:if>

                          </xsl:for-each>

                        </xsl:if>
                        <!--FINE DATI DELLA RITENUTA-->

                        <!--INIZIO DATI DEL BOLLO-->
                        <xsl:if test="DatiGenerali/DatiGeneraliDocumento/DatiBollo">

                          <xsl:for-each select="DatiGenerali/DatiGeneraliDocumento/DatiBollo">
                            <h4>Bollo</h4>
                            <xsl:if test="BolloVirtuale">
                              Bollo virtuale:
                              <span>
                                <xsl:value-of select="BolloVirtuale" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="ImportoBollo">
                              Importo bollo:
                              <span>
                                <xsl:value-of select="ImportoBollo" />
                              </span>
                              <br />
                            </xsl:if>

                          </xsl:for-each>

                        </xsl:if>
                        <!--FINE DATI DEL BOLLO-->

                        <!--INIZIO DATI DELLA CASSA PREVIDENZIALE-->
                        <xsl:if test="DatiGenerali/DatiGeneraliDocumento/DatiCassaPrevidenziale">

                          <h4>Cassa previdenziale</h4>
                          <xsl:for-each select="DatiGenerali/DatiGeneraliDocumento/DatiCassaPrevidenziale">

                            <xsl:if test="TipoCassa">
                              Tipologia cassa previdenziale:
                              <span>
                                <xsl:value-of select="TipoCassa" />
                              </span>
                              <xsl:variable name="TC">
                                <xsl:value-of select="TipoCassa" />
                              </xsl:variable>
                              <xsl:choose>
                                <xsl:when test="$TC='TC01'">
                                  (Cassa Nazionale Previdenza e Assistenza Avvocati
                                  e Procuratori legali)
                                </xsl:when>
                                <xsl:when test="$TC='TC02'">
                                  (Cassa Previdenza Dottori Commercialisti)
                                </xsl:when>
                                <xsl:when test="$TC='TC03'">
                                  (Cassa Previdenza e Assistenza Geometri)
                                </xsl:when>
                                <xsl:when test="$TC='TC04'">
                                  (Cassa Nazionale Previdenza e Assistenza
                                  Ingegneri e Architetti liberi profess.)
                                </xsl:when>
                                <xsl:when test="$TC='TC05'">
                                  (Cassa Nazionale del Notariato)
                                </xsl:when>
                                <xsl:when test="$TC='TC06'">
                                  (Cassa Nazionale Previdenza e Assistenza
                                  Ragionieri e Periti commerciali)
                                </xsl:when>
                                <xsl:when test="$TC='TC07'">
                                  (Ente Nazionale Assistenza Agenti e Rappresentanti
                                  di Commercio-ENASARCO)
                                </xsl:when>
                                <xsl:when test="$TC='TC08'">
                                  (Ente Nazionale Previdenza e Assistenza Consulenti
                                  del Lavoro-ENPACL)
                                </xsl:when>
                                <xsl:when test="$TC='TC09'">
                                  (Ente Nazionale Previdenza e Assistenza
                                  Medici-ENPAM)
                                </xsl:when>
                                <xsl:when test="$TC='TC10'">
                                  (Ente Nazionale Previdenza e Assistenza
                                  Farmacisti-ENPAF)
                                </xsl:when>
                                <xsl:when test="$TC='TC11'">
                                  (Ente Nazionale Previdenza e Assistenza
                                  Veterinari-ENPAV)
                                </xsl:when>
                                <xsl:when test="$TC='TC12'">
                                  (Ente Nazionale Previdenza e Assistenza Impiegati
                                  dell'Agricoltura-ENPAIA)
                                </xsl:when>
                                <xsl:when test="$TC='TC13'">
                                  (Fondo Previdenza Impiegati Imprese di Spedizione
                                  e Agenzie Marittime)
                                </xsl:when>
                                <xsl:when test="$TC='TC14'">
                                  (Istituto Nazionale Previdenza Giornalisti
                                  Italiani-INPGI)
                                </xsl:when>
                                <xsl:when test="$TC='TC15'">
                                  (Opera Nazionale Assistenza Orfani Sanitari
                                  Italiani-ONAOSI)
                                </xsl:when>
                                <xsl:when test="$TC='TC16'">
                                  (Cassa Autonoma Assistenza Integrativa
                                  Giornalisti Italiani-CASAGIT)
                                </xsl:when>
                                <xsl:when test="$TC='TC17'">
                                  (Ente Previdenza Periti Industriali e Periti
                                  Industriali Laureati-EPPI)
                                </xsl:when>
                                <xsl:when test="$TC='TC18'">
                                  (Ente Previdenza e Assistenza
                                  Pluricategoriale-EPAP)
                                </xsl:when>
                                <xsl:when test="$TC='TC19'">
                                  (Ente Nazionale Previdenza e Assistenza
                                  Biologi-ENPAB)
                                </xsl:when>
                                <xsl:when test="$TC='TC20'">
                                  (Ente Nazionale Previdenza e Assistenza
                                  Professione Infermieristica-ENPAPI)
                                </xsl:when>
                                <xsl:when test="$TC='TC21'">
                                  (Ente Nazionale Previdenza e Assistenza
                                  Psicologi-ENPAP)
                                </xsl:when>
                                <xsl:when test="$TC='TC22'">
                                  (INPS)
                                </xsl:when>
                                <xsl:when test="$TC=''">
                                </xsl:when>
                                <xsl:otherwise>
                                  <span>(!!! codice non previsto !!!)</span>
                                </xsl:otherwise>
                              </xsl:choose>
                              <br />
                            </xsl:if>

                            <xsl:if test="AlCassa">
                              Aliquota contributo cassa (%):
                              <span>
                                <xsl:value-of select="AlCassa" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="ImportoContributoCassa">
                              Importo contributo cassa:
                              <span>
                                <xsl:value-of select="ImportoContributoCassa" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="ImponibileCassa">
                              Imponibile previdenziale:
                              <span>
                                <xsl:value-of select="ImponibileCassa" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="AliquotaIVA">
                              Aliquota IVA applicata:
                              <span>
                                <xsl:value-of select="AliquotaIVA" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="Ritenuta">
                              Contributo cassa soggetto a ritenuta:
                              <span>
                                <xsl:value-of select="Ritenuta" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="Natura">
                              Tipologia di non imponibilità del contributo:
                              <span>
                                <xsl:value-of select="Natura" />
                              </span>
                              <xsl:variable name="NT">
                                <xsl:value-of select="Natura" />
                              </xsl:variable>
                              <xsl:choose>
                                <xsl:when test="$NT='N1'">
                                  (escluse ex art. 15)
                                </xsl:when>
                                <xsl:when test="$NT='N2'">
                                  (non soggette)
                                </xsl:when>
                                <xsl:when test="$NT='N3'">
                                  (non imponibili)
                                </xsl:when>
                                <xsl:when test="$NT='N4'">
                                  (esenti)
                                </xsl:when>
                                <xsl:when test="$NT='N5'">
                                  (regime del margine / IVA non esposta in fattura)
                                </xsl:when>
                                <xsl:when test="$NT='N6'">
                                  (inversione contabile)
                                </xsl:when>
                                <xsl:when test="$NT='N7'">
                                  (IVA assolta in altro Stato UE)
                                </xsl:when>


                                <xsl:when test="$NT='N2.1'">
                                  (non soggette ad IVA artt. da 7 a 7-septies del DPR 633/72)
                                </xsl:when>
                                <xsl:when test="$NT='N2.2'">
                                  (non soggette - altri casi)
                                </xsl:when>
                                <xsl:when test="$NT='N3.1'">
                                  (non imponibili - esportazioni)
                                </xsl:when>
                                <xsl:when test="$NT='N3.2'">
                                  (non imponibili - cessioni intracomunitarie)
                                </xsl:when>
                                <xsl:when test="$NT='N3.3'">
                                  (non imponibili - cessioni verso San Marino)
                                </xsl:when>
                                <xsl:when test="$NT='N3.4'">
                                  (non imponibili - operazioni assimilate alle cessioni all'esportazione)
                                </xsl:when>
                                <xsl:when test="$NT='N3.5'">
                                  (non imponibili - a seguito di dichiarazioni d'intento)
                                </xsl:when>
                                <xsl:when test="$NT='N3.6'">
                                  (non imponibili - altre operazioni che non concorrono alla formaz. del plafond)
                                </xsl:when>
                                <xsl:when test="$NT='N6.1'">
                                  (inversione contabile - cessione di rottami e altri materiali di recupero)
                                </xsl:when>
                                <xsl:when test="$NT='N6.2'">
                                  (inversione contabile - cessione di oro e argento puro)
                                </xsl:when>
                                <xsl:when test="$NT='N6.3'">
                                  (inversione contabile - subappalto nel settore edile)
                                </xsl:when>
                                <xsl:when test="$NT='N6.4'">
                                  (inversione contabile - cessione di fabbricati)
                                </xsl:when>
                                <xsl:when test="$NT='N6.5'">
                                  (inversione contabile - cessione di telefoni cellulari)
                                </xsl:when>
                                <xsl:when test="$NT='N6.6'">
                                  (inversione contabile - cessione di prodotti elettronici)
                                </xsl:when>
                                <xsl:when test="$NT='N6.7'">
                                  (inversione contabile - prestazioni comparto edile e settori connessi)
                                </xsl:when>
                                <xsl:when test="$NT='N6.8'">
                                  (inversione contabile - operazioni settore energetico)
                                </xsl:when>
                                <xsl:when test="$NT='N6.9'">
                                  (inversione contabile - altri casi)
                                </xsl:when>


                                <xsl:when test="$NT=''">
                                </xsl:when>
                                <xsl:otherwise>
                                  <span>(!!! codice non previsto !!!)</span>
                                </xsl:otherwise>
                              </xsl:choose>
                              <br />
                            </xsl:if>

                            <xsl:if test="RiferimentoAmministrazione">
                              Riferimento amministrativo / contabile:
                              <span>
                                <xsl:value-of select="RiferimentoAmministrazione" />
                              </span>
                              <br />
                            </xsl:if>

                          </xsl:for-each>

                        </xsl:if>
                        <!--FINE DATI DELLA CASSA PREVIDENZIALE-->

                        <!--INIZIO DATI SCONTO / MAGGIORAZIONE-->
                        <xsl:if test="DatiGenerali/DatiGeneraliDocumento/ScontoMaggiorazione">

                          <h4>Sconto/maggiorazione</h4>
                          <xsl:for-each select="DatiGenerali/DatiGeneraliDocumento/ScontoMaggiorazione">

                            <xsl:if test="Tipo">
                              Tipologia:
                              <span>
                                <xsl:value-of select="Tipo" />
                              </span>
                              <xsl:variable name="TSM">
                                <xsl:value-of select="Tipo" />
                              </xsl:variable>
                              <xsl:choose>
                                <xsl:when test="$TSM='SC'">
                                  (sconto)
                                </xsl:when>
                                <xsl:when test="$TSM='MG'">
                                  (maggiorazione)
                                </xsl:when>
                                <xsl:otherwise>
                                  <span>(!!! codice non previsto !!!)</span>
                                </xsl:otherwise>
                              </xsl:choose>
                              <br />
                            </xsl:if>

                            <xsl:if test="Percentuale">
                              Percentuale:
                              <span>
                                <xsl:value-of select="Percentuale" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="Importo">
                              Importo:
                              <span>
                                <xsl:value-of select="Importo" />
                              </span>
                              <br />
                            </xsl:if>

                          </xsl:for-each>

                        </xsl:if>
                        <!--FINE DATI SCONTO / MAGGIORAZIONE-->

                      </xsl:if>

                      <!--INIZIO DATI DELL'ORDINE DI ACQUISTO-->
                      <xsl:if test="DatiGenerali/DatiOrdineAcquisto">
                        <h4>Ordine di Acquisto</h4>
                        <xsl:for-each select="DatiGenerali/DatiOrdineAcquisto">

                          <xsl:if test="RiferimentoNumeroLinea">
                            Numero linea di fattura a cui si riferisce:
                            <xsl:for-each select="RiferimentoNumeroLinea">
                              <span>
                                <xsl:if test="(position( )) > 1">
                                  ,
                                </xsl:if>
                                <xsl:value-of select="." />
                              </span>
                            </xsl:for-each>
                            <br />
                          </xsl:if>

                          <xsl:if test="IdDocumento">
                            Identificativo ordine di acquisto:
                            <span>
                              <xsl:value-of select="IdDocumento" />
                            </span>
                            <br />
                          </xsl:if>

                          <xsl:if test="Data">
                            Data ordine di acquisto:
                            <span>
                              <xsl:value-of select="Data" />
                            </span>
                            <xsl:call-template name="FormatDate">
                              <xsl:with-param name="DateTime" select="Data" />
                            </xsl:call-template>
                            <br />
                          </xsl:if>

                          <xsl:if test="NumItem">
                            Numero linea ordine di acquisto:
                            <span>
                              <xsl:value-of select="NumItem" />
                            </span>
                            <br />
                          </xsl:if>

                          <xsl:if test="CodiceCommessaConvenzione">
                            Codice commessa/convenzione:
                            <span>
                              <xsl:value-of select="CodiceCommessaConvenzione" />
                            </span>
                            <br />
                          </xsl:if>

                          <xsl:if test="CodiceCUP">
                            Codice Unitario Progetto (CUP):
                            <span>
                              <xsl:value-of select="CodiceCUP" />
                            </span>
                            <br />
                          </xsl:if>

                          <xsl:if test="CodiceCIG">
                            Codice Identificativo Gara (CIG):
                            <span>
                              <xsl:value-of select="CodiceCIG" />
                            </span>
                            <br />
                          </xsl:if>

                        </xsl:for-each>
                      </xsl:if>
                      <!--FINE DATI DELL'ORDINE DI ACQUISTO-->

                      <!--INIZIO DATI DEL CONTRATTO-->
                      <xsl:if test="DatiGenerali/DatiContratto">

                        <xsl:for-each select="DatiGenerali/DatiContratto">

                          <xsl:if test="RiferimentoNumeroLinea">
                            Numero linea di fattura a cui si riferisce:
                            <xsl:for-each select="RiferimentoNumeroLinea">
                              <span>
                                <xsl:if test="(position( )) > 1">
                                  ,
                                </xsl:if>
                                <xsl:value-of select="." />
                              </span>
                            </xsl:for-each>
                            <br />
                          </xsl:if>

                          <xsl:if test="IdDocumento">
                            Identificativo contratto:
                            <span>
                              <xsl:value-of select="IdDocumento" />
                            </span>
                            <br />
                          </xsl:if>

                          <xsl:if test="Data">
                            Data contratto:
                            <span>
                              <xsl:value-of select="Data" />
                            </span>
                            <xsl:call-template name="FormatDate">
                              <xsl:with-param name="DateTime" select="Data" />
                            </xsl:call-template>
                            <br />
                          </xsl:if>

                          <xsl:if test="NumItem">
                            Numero linea contratto:
                            <span>
                              <xsl:value-of select="NumItem" />
                            </span>
                            <br />
                          </xsl:if>

                          <xsl:if test="CodiceCommessaConvenzione">
                            Codice commessa/convenzione:
                            <span>
                              <xsl:value-of select="CodiceCommessaConvenzione" />
                            </span>
                            <br />
                          </xsl:if>

                          <xsl:if test="CodiceCUP">
                            Codice Unitario Progetto (CUP):
                            <span>
                              <xsl:value-of select="CodiceCUP" />
                            </span>
                            <br />
                          </xsl:if>

                          <xsl:if test="CodiceCIG">
                            Codice Identificativo Gara (CIG):
                            <span>
                              <xsl:value-of select="CodiceCIG" />
                            </span>
                            <br />
                          </xsl:if>

                        </xsl:for-each>

                      </xsl:if>
                      <!--FINE DATI DEL CONTRATTO-->

                      <!--INIZIO DATI CONVENZIONE-->
                      <xsl:if test="DatiGenerali/DatiConvenzione">
                        <xsl:for-each select="DatiGenerali/DatiConvenzione">

                          <xsl:if test="RiferimentoNumeroLinea">
                            Numero linea di fattura a cui si riferisce:
                            <xsl:for-each select="RiferimentoNumeroLinea">
                              <span>
                                <xsl:if test="(position( )) > 1">
                                  ,
                                </xsl:if>
                                <xsl:value-of select="." />
                              </span>
                            </xsl:for-each>
                            <br />
                          </xsl:if>

                          <xsl:if test="IdDocumento">
                            Identificativo convenzione:
                            <span>
                              <xsl:value-of select="IdDocumento" />
                            </span>
                            <br />
                          </xsl:if>

                          <xsl:if test="Data">
                            Data convenzione:
                            <span>
                              <xsl:value-of select="Data" />
                            </span>
                            <xsl:call-template name="FormatDate">
                              <xsl:with-param name="DateTime" select="Data" />
                            </xsl:call-template>
                            <br />
                          </xsl:if>

                          <xsl:if test="NumItem">
                            Numero linea convenzione:
                            <span>
                              <xsl:value-of select="NumItem" />
                            </span>
                            <br />
                          </xsl:if>

                          <xsl:if test="CodiceCommessaConvenzione">
                            Codice commessa/convenzione:
                            <span>
                              <xsl:value-of select="CodiceCommessaConvenzione" />
                            </span>
                            <br />
                          </xsl:if>

                          <xsl:if test="CodiceCUP">
                            Codice Unitario Progetto (CUP):
                            <span>
                              <xsl:value-of select="CodiceCUP" />
                            </span>
                            <br />
                          </xsl:if>

                          <xsl:if test="CodiceCIG">
                            Codice Identificativo Gara (CIG):
                            <span>
                              <xsl:value-of select="CodiceCIG" />
                            </span>
                            <br />
                          </xsl:if>

                        </xsl:for-each>
                      </xsl:if>
                      <!--FINE DATI CONVENZIONE-->

                      <!--INIZIO DATI RICEZIONE-->
                      <xsl:if test="DatiGenerali/DatiRicezione">
                        <xsl:for-each select="DatiGenerali/DatiRicezione">

                          <xsl:if test="RiferimentoNumeroLinea">
                            Numero linea di fattura a cui si riferisce:
                            <xsl:for-each select="RiferimentoNumeroLinea">
                              <span>
                                <xsl:if test="(position( )) > 1">
                                  ,
                                </xsl:if>
                                <xsl:value-of select="." />
                              </span>
                            </xsl:for-each>
                            <br />
                          </xsl:if>

                          <xsl:if test="IdDocumento">
                            Identificativo ricezione:
                            <span>
                              <xsl:value-of select="IdDocumento" />
                            </span>
                            <br />
                          </xsl:if>

                          <xsl:if test="Data">
                            Data ricezione:
                            <span>
                              <xsl:value-of select="Data" />
                            </span>
                            <xsl:call-template name="FormatDate">
                              <xsl:with-param name="DateTime" select="Data" />
                            </xsl:call-template>
                            <br />
                          </xsl:if>

                          <xsl:if test="NumItem">
                            Numero linea ricezione:
                            <span>
                              <xsl:value-of select="NumItem" />
                            </span>
                            <br />
                          </xsl:if>

                          <xsl:if test="CodiceCommessaConvenzione">
                            Codice commessa/convenzione:
                            <span>
                              <xsl:value-of select="CodiceCommessaConvenzione" />
                            </span>
                            <br />
                          </xsl:if>

                          <xsl:if test="CodiceCUP">
                            Codice Unitario Progetto (CUP):
                            <span>
                              <xsl:value-of select="CodiceCUP" />
                            </span>
                            <br />
                          </xsl:if>

                          <xsl:if test="CodiceCIG">
                            Codice Identificativo Gara (CIG):
                            <span>
                              <xsl:value-of select="CodiceCIG" />
                            </span>
                            <br />
                          </xsl:if>

                        </xsl:for-each>
                      </xsl:if>
                      <!--FINE DATI RICEZIONE-->

                      <!--INIZIO DATI FATTURE COLLEGATE-->
                      <xsl:if test="DatiGenerali/DatiFattureCollegate">
                        <xsl:for-each select="DatiGenerali/DatiFattureCollegate">

                          <xsl:if test="RiferimentoNumeroLinea">
                            Numero linea di fattura a cui si riferisce:
                            <xsl:for-each select="RiferimentoNumeroLinea">
                              <span>
                                <xsl:if test="(position( )) > 1">
                                  ,
                                </xsl:if>
                                <xsl:value-of select="." />
                              </span>
                            </xsl:for-each>
                            <br />
                          </xsl:if>

                          <xsl:if test="IdDocumento">
                            Identificativo fattura collegata:
                            <span>
                              <xsl:value-of select="IdDocumento" />
                            </span>
                            <br />
                          </xsl:if>

                          <xsl:if test="Data">
                            Data fattura collegata:
                            <span>
                              <xsl:value-of select="Data" />
                            </span>
                            <xsl:call-template name="FormatDate">
                              <xsl:with-param name="DateTime" select="Data" />
                            </xsl:call-template>
                            <br />
                          </xsl:if>

                          <xsl:if test="NumItem">
                            Numero linea fattura collegata:
                            <span>
                              <xsl:value-of select="NumItem" />
                            </span>
                            <br />
                          </xsl:if>

                          <xsl:if test="CodiceCommessaConvenzione">
                            Codice commessa/convenzione:
                            <span>
                              <xsl:value-of select="CodiceCommessaConvenzione" />
                            </span>
                            <br />
                          </xsl:if>

                          <xsl:if test="CodiceCUP">
                            Codice Unitario Progetto (CUP):
                            <span>
                              <xsl:value-of select="CodiceCUP" />
                            </span>
                            <br />
                          </xsl:if>

                          <xsl:if test="CodiceCIG">
                            Codice Identificativo Gara (CIG):
                            <span>
                              <xsl:value-of select="CodiceCIG" />
                            </span>
                            <br />
                          </xsl:if>

                        </xsl:for-each>
                      </xsl:if>
                      <!--FINE DATI FATTURE COLLEGATE-->

                      <!--INIZIO DATI RIFERIMENTO SAL-->
                      <xsl:if test="DatiGenerali/DatiSAL">
                        <xsl:if test="DatiGenerali/DatiSAL/RiferimentoFase">
                          Numero fase avanzamento SAL:
                          <xsl:for-each select="DatiGenerali/DatiSAL/RiferimentoFase">
                            <span>
                              <xsl:if test="(position( )) > 1">
                                ,
                              </xsl:if>
                              <xsl:value-of select="." />
                            </span>
                          </xsl:for-each>
                          <br />
                        </xsl:if>
                      </xsl:if>
                      <!--FINE DATI RIFERIMENTO SAL-->

                      <!--INIZIO DATI DDT-->
                      <xsl:if test="DatiGenerali/DatiDDT">
                        <h4>DDT</h4>
                        <xsl:for-each select="DatiGenerali/DatiDDT">

                          <xsl:if test="NumeroDDT">
                            Numero DDT:
                            <span>
                              <xsl:value-of select="NumeroDDT" />
                            </span>
                            <br />
                          </xsl:if>

                          <xsl:if test="DataDDT">
                            Data DDT:
                            <span>
                              <xsl:value-of select="DataDDT" />
                            </span>
                            <xsl:call-template name="FormatDate">
                              <xsl:with-param name="DateTime" select="DataDDT" />
                            </xsl:call-template>
                            <br />
                          </xsl:if>

                          <xsl:if test="RiferimentoNumeroLinea">
                            Numero linea di fattura a cui si riferisce:
                            <xsl:for-each select="RiferimentoNumeroLinea">
                              <span>
                                <xsl:if test="(position( )) > 1">
                                  ,
                                </xsl:if>
                                <xsl:value-of select="." />
                              </span>
                            </xsl:for-each>
                            <br />
                          </xsl:if>

                        </xsl:for-each>
                      </xsl:if>
                      <!--FINE DATI DDT-->

                      <!--INIZIO DATI TRASPORTO-->
                      <xsl:if test="DatiGenerali/DatiTrasporto">

                        <xsl:if test="DatiGenerali/DatiTrasporto/DatiAnagraficiVettore">
                          <h4>Dati del vettore</h4>

                          <xsl:for-each select="DatiGenerali/DatiTrasporto/DatiAnagraficiVettore">

                            <xsl:if test="IdFiscaleIVA/IdPaese">
                              Identificativo fiscale ai fini IVA:
                              <span>
                                <xsl:value-of select="IdFiscaleIVA/IdPaese" />
                                <xsl:value-of select="IdFiscaleIVA/IdCodice" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="CodiceFiscale">
                              Codice Fiscale:
                              <span>
                                <xsl:value-of select="CodiceFiscale" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="Anagrafica/Denominazione">
                              Denominazione:
                              <span>
                                <xsl:value-of select="Anagrafica/Denominazione" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="Anagrafica/Nome">
                              Nome:
                              <span>
                                <xsl:value-of select="Anagrafica/Nome" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="Anagrafica/Cognome">
                              Cognome:
                              <span>
                                <xsl:value-of select="Anagrafica/Cognome" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="Anagrafica/Titolo">
                              Titolo onorifico:
                              <span>
                                <xsl:value-of select="Anagrafica/Titolo" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="Anagrafica/CodEORI">
                              Codice EORI:
                              <span>
                                <xsl:value-of select="Anagrafica/CodEORI" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="NumeroLicenzaGuida">
                              Numero licenza di guida:
                              <span>
                                <xsl:value-of select="NumeroLicenzaGuida" />
                              </span>
                              <br />
                            </xsl:if>

                          </xsl:for-each>

                        </xsl:if>

                        <xsl:if
                          test="DatiGenerali/DatiTrasporto/MezzoTrasporto or DatiGenerali/DatiTrasporto/CausaleTrasporto or DatiGenerali/DatiTrasporto/NumeroColli or DatiGenerali/DatiTrasporto/Descrizione or DatiGenerali/DatiTrasporto/UnitaMisuraPeso or DatiGenerali/DatiTrasporto/PesoLordo or DatiGenerali/DatiTrasporto/PesoNetto or DatiGenerali/DatiTrasporto/DataOraRitiro or DatiGenerali/DatiTrasporto/DataInizioTrasporto or DatiGenerali/DatiTrasporto/TipoResa or DatiGenerali/DatiTrasporto/IndirizzoResa">
                          <h4>Altri dati</h4>

                          <xsl:for-each select="DatiGenerali/DatiTrasporto">
                            <xsl:if test="MezzoTrasporto">
                              Mezzo di trasporto:
                              <span>
                                <xsl:value-of select="MezzoTrasporto" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="CausaleTrasporto">
                              Causale trasporto:
                              <span>
                                <xsl:value-of select="CausaleTrasporto" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="NumeroColli">
                              Numero colli trasportati:
                              <span>
                                <xsl:value-of select="NumeroColli" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="Descrizione">
                              Descrizione beni trasportati:
                              <span>
                                <xsl:value-of select="Descrizione" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="UnitaMisuraPeso">
                              Unità di misura del peso merce:
                              <span>
                                <xsl:value-of select="UnitaMisuraPeso" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="PesoLordo">
                              Peso lordo:
                              <span>
                                <xsl:value-of select="PesoLordo" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="PesoNetto">
                              Peso netto:
                              <span>
                                <xsl:value-of select="PesoNetto" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="DataOraRitiro">
                              Data e ora ritiro merce:
                              <span>
                                <xsl:value-of select="DataOraRitiro" />
                              </span>
                              <xsl:call-template name="FormatDate">
                                <xsl:with-param name="DateTime" select="DataOraRitiro" />
                              </xsl:call-template>
                              <br />
                            </xsl:if>

                            <xsl:if test="DataInizioTrasporto">
                              Data inizio trasporto:
                              <span>
                                <xsl:value-of select="DataInizioTrasporto" />
                              </span>
                              <xsl:call-template name="FormatDate">
                                <xsl:with-param name="DateTime" select="DataInizioTrasporto" />
                              </xsl:call-template>
                              <br />
                            </xsl:if>

                            <xsl:if test="TipoResa">
                              Tipologia di resa:
                              <span>
                                <xsl:value-of select="TipoResa" />
                              </span>
                              (codifica secondo standard ICC)
                              <br />
                            </xsl:if>

                            <xsl:if test="IndirizzoResa/Indirizzo">
                              Indirizzo di resa:
                              <span>
                                <xsl:value-of select="IndirizzoResa/Indirizzo" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="IndirizzoResa/NumeroCivico">
                              Numero civico indirizzo di resa:
                              <span>
                                <xsl:value-of select="IndirizzoResa/NumeroCivico" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="IndirizzoResa/CAP">
                              CAP indirizzo di resa:
                              <span>
                                <xsl:value-of select="IndirizzoResa/CAP" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="IndirizzoResa/Comune">
                              Comune di resa:
                              <span>
                                <xsl:value-of select="IndirizzoResa/Comune" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="IndirizzoResa/Provincia">
                              Provincia di resa:
                              <span>
                                <xsl:value-of select="IndirizzoResa/Provincia" />
                              </span>
                              <br />
                            </xsl:if>

                            <xsl:if test="IndirizzoResa/Nazione">
                              Nazione di resa:
                              <span>
                                <xsl:value-of select="IndirizzoResa/Nazione" />
                              </span>
                              <br />
                            </xsl:if>

                          </xsl:for-each>

                        </xsl:if>

                      </xsl:if>
                      <!--FINE DATI TRASPORTO-->

                      <!--INIZIO FATTURA PRINCIPALE-->
                      <!--<xsl:if test="DatiGenerali/FatturaPrincipale">-->
                      <xsl:choose>

                        <xsl:when test="DatiGenerali/FatturaPrincipale">

                          <xsl:if test="DatiGenerali/FatturaPrincipale/NumeroFatturaPrincipale">
                            Numero fattura principale:
                            <span>
                              <xsl:value-of select="DatiGenerali/FatturaPrincipale/NumeroFatturaPrincipale" />
                            </span>
                            <br />
                          </xsl:if>

                          <xsl:if test="DatiGenerali/FatturaPrincipale/DataFatturaPrincipale">
                            Data fattura principale:
                            <span>
                              <xsl:value-of select="DatiGenerali/FatturaPrincipale/DataFatturaPrincipale" />
                            </span>
                            <xsl:call-template name="FormatDate">
                              <xsl:with-param name="DateTime" select="DatiGenerali/FatturaPrincipale/DataFatturaPrincipale" />
                            </xsl:call-template>
                            <br />
                          </xsl:if>

                        </xsl:when>
                        <!--<xsl:otherwise>
                            <span>nessun dato</span>
                          </xsl:otherwise>-->

                      </xsl:choose>
                      <!--</xsl:if>-->
                      <!--FINE FATTURA PRINCIPALE-->

                    </xsl:if>
                    <!--FINE DATI GENERALI-->

                    <!--INIZIO DATI VEICOLI-->
                    <xsl:if test="DatiVeicoli">
                      <h4>Dati Veicoli ex art. 38 dl 331/1993</h4>
                      <xsl:for-each select="DatiVeicoli">

                        <xsl:if test="Data">
                          Data prima immatricolazione / iscrizione PR:
                          <span>
                            <xsl:value-of select="Data" />
                          </span>
                          <xsl:call-template name="FormatDate">
                            <xsl:with-param name="DateTime" select="Data" />
                          </xsl:call-template>
                          <br />
                        </xsl:if>

                        <xsl:if test="TotalePercorso">
                          Totale percorso:
                          <span>
                            <xsl:value-of select="TotalePercorso" />
                          </span>
                          <br />
                        </xsl:if>

                      </xsl:for-each>
                    </xsl:if>
                    <!--FINE DATI VEICOLI-->

                    <!--INIZIO ALLEGATI-->
                    <xsl:if test="Allegati">
                      <h4>Allegati</h4>
                      <xsl:for-each select="Allegati">

                        <!-- ### CONTATORE ATTACHMENT ### -->
                        <xsl:variable name="i" select="position()" />

                        <xsl:if test="NomeAttachment">
                          Nome dell'allegato:
                          <span>
                            <xsl:value-of select="NomeAttachment" />
                          </span>
                          <br />
                        </xsl:if>

                        <xsl:if test="AlgoritmoCompressione">
                          Algoritmo di compressione:
                          <span>
                            <xsl:value-of select="AlgoritmoCompressione" />
                          </span>
                          <br />
                        </xsl:if>

                        <xsl:if test="FormatoAttachment">
                          Formato:
                          <span>
                            <xsl:value-of select="FormatoAttachment" />
                          </span>
                          <br />
                        </xsl:if>

                        <xsl:if test="DescrizioneAttachment">
                          Descrizione:
                          <span>
                            <xsl:value-of select="DescrizioneAttachment" />
                          </span>
                          <br />
                        </xsl:if>

                        <!-- ##### BASE64 OUTPUT DA CONVERTIRE IN BLOB CON JAVASCRIPT SUCCESSIVAMENTE VD PLUGIN b64toBlob #####-->
                        <xsl:if test="Attachment">
                          <xsl:if test="NomeAttachment">
                            <script type="text/javascript">
                              myObjAttachment = {AttachmentNumber: '<xsl:value-of select="$i" />', filename: '<xsl:value-of select="NomeAttachment" />', b64Data: '<xsl:value-of select="Attachment" />'};
                              myAttachments.push(myObjAttachment);
                            </script>
                            <button type="button" class="btn btn-primary" data-attachmentnumber="{$i}" onclick="downloadAttachmentByAttachmentNumber('{$i}');">download</button>
                            <br />
                          </xsl:if>
                        </xsl:if>

                      </xsl:for-each>
                    </xsl:if>
                    <!--FINE ALLEGATI-->

                  </div>
                </div>
                <!--/panel panel-primary-->

              </div>
            </div>

          </xsl:if>

        </xsl:for-each>
        <!--FINE BODY-->

        <!--</div>-->
      </xsl:if>

    </div>

    <!--                        
      </body>
    </html>
      -->

  </xsl:template>
</xsl:stylesheet>