<?xml version="1.0" encoding="utf-8"?>
<xsl:stylesheet
	version="1.1"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:a="http://ivaservizi.agenziaentrate.gov.it/docs/xsd/fatture/v1.0">

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
        
        <div class="containerFE">         
          <!--INIZIO DATI HEADER-->
          <xsl:if test="a:FatturaElettronicaSemplificata">

            <xsl:if test="a:FatturaElettronicaSemplificata/FatturaElettronicaHeader">

              <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                  <h1>FATTURA ELETTRONICA</h1>
                </div>
              </div>

              <!--INIZIO DATI DELLA TRASMISSIONE-->
              <xsl:if test="a:FatturaElettronicaSemplificata/FatturaElettronicaHeader/DatiTrasmissione">

                <div class="row">
                  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                    <xsl:for-each select="a:FatturaElettronicaSemplificata/FatturaElettronicaHeader/DatiTrasmissione">
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
                      <xsl:if test="FormatoTrasmissione">

                        Formato Trasmissione:
                        <span>
                          <xsl:value-of select="FormatoTrasmissione" />
                        </span>
                        <br />
                      </xsl:if>
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
                    </xsl:for-each>

                  </div>
                </div>

              </xsl:if>
              <!--FINE DATI DELLA TRASMISSIONE-->
            </xsl:if>
            <!--/ FatturaElettronica/FatturaElettronicaHeader-->

            <xsl:for-each select="a:FatturaElettronicaSemplificata/FatturaElettronicaBody">
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
                            <xsl:when test="$TD='TD20'">
                              (autofattura)
                            </xsl:when>
                            <xsl:when test="$TD='TD07'">
                              (fattura semplificata)
                            </xsl:when>
                            <xsl:when test="$TD='TD08'">
                              (nota di credito semplificata)
                            </xsl:when>
                            <xsl:when test="$TD='TD09'">
                              (nota di debito semplificata)
                            </xsl:when>
                            <xsl:when test="$TD=''">
                            </xsl:when>
                            <xsl:otherwise>
                              <span>(!!! codice non previsto !!!)</span>
                            </xsl:otherwise>
                          </xsl:choose>
                          <br />
                        </xsl:if>
                        <xsl:if test="DatiGenerali/DatiGeneraliDocumento/Divisa">

                          Valuta importi:
                          <span>
                            <xsl:value-of select="DatiGenerali/DatiGeneraliDocumento/Divisa" />
                          </span>
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
                        <xsl:if test="DatiGenerali/DatiGeneraliDocumento/ImportoTotaleDocumento">

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
                      </div>
                    </div>
                    <!--FINE DATI GENERALI DOCUMENTO-->
                  </div>
                </div>
              </xsl:if>
            </xsl:for-each>


            <xsl:if test="a:FatturaElettronicaSemplificata/FatturaElettronicaHeader">

              <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                  <div class="row">

                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                      <!--INIZIO DATI CEDENTE PRESTATORE-->
                      <xsl:if test="a:FatturaElettronicaSemplificata/FatturaElettronicaHeader/CedentePrestatore">

                        <div class="panel panel-primary">
                          <div class="panel-heading">
                            <h3 class="panel-title">Fornitore (cedente/prestatore)</h3>
                          </div>
                          <div class="panel-body">

                            <xsl:if test="a:FatturaElettronicaSemplificata/FatturaElettronicaHeader/CedentePrestatore/DatiAnagrafici">
                              <h4>Dati anagrafici</h4>


                              <xsl:for-each select="a:FatturaElettronicaSemplificata/FatturaElettronicaHeader/CedentePrestatore/DatiAnagrafici">
                                <xsl:if test="IdFiscaleIVA">

                                  Identificativo fiscale ai fini IVA:
                                  <span>
                                    <xsl:value-of select="IdFiscaleIVA/IdPaese" />
                                    <xsl:value-of select="IdFiscaleIVA/IdCodice" />
                                  </span>
                                  <br />
                                </xsl:if>
                                <xsl:if test="CodiceFiscale">

                                  Codice fiscale:
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
                                    <xsl:when test="$RF=''">
                                    </xsl:when>
                                    <xsl:otherwise>
                                      <span>(!!! codice non previsto !!!)</span>
                                    </xsl:otherwise>
                                  </xsl:choose>
                                  <br />
                                </xsl:if>
                              </xsl:for-each>

                            </xsl:if>

                            <xsl:if test="a:FatturaElettronicaSemplificata/FatturaElettronicaHeader/CedentePrestatore/Sede">
                              <h4>Dati della sede</h4>

                              <xsl:for-each select="a:FatturaElettronicaSemplificata/FatturaElettronicaHeader/CedentePrestatore/Sede">
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

                            <xsl:if test="a:FatturaElettronicaSemplificata/FatturaElettronicaHeader/CedentePrestatore/StabileOrganizzazione">
                              <h4>Dati della stabile organizzazione</h4>

                              <xsl:for-each select="a:FatturaElettronicaSemplificata/FatturaElettronicaHeader/CedentePrestatore/StabileOrganizzazione">
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

                            <xsl:if test="a:FatturaElettronicaSemplificata/FatturaElettronicaHeader/CedentePrestatore/IscrizioneREA">
                              <h4>Dati di iscrizione nel registro delle imprese</h4>

                              <xsl:for-each select="a:FatturaElettronicaSemplificata/FatturaElettronicaHeader/CedentePrestatore/IscrizioneREA">
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

                            <xsl:for-each select="a:FatturaElettronicaSemplificata/FatturaElettronicaHeader/CedentePrestatore/Contatti">
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

                            <xsl:if test="a:FatturaElettronicaSemplificata/FatturaElettronicaHeader/CedentePrestatore/RiferimentoAmministrazione">
                              <h4>Riferimento amministrativo</h4>


                              Riferimento:
                              <span>
                                <xsl:value-of select="a:FatturaElettronicaSemplificata/FatturaElettronicaHeader/CedentePrestatore/RiferimentoAmministrazione" />
                              </span>
                              <br />

                            </xsl:if>

                          </div>
                        </div>

                      </xsl:if>
                      <!--FINE DATI CEDENTE PRESTATORE-->
                    </div>

                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
                      <!--INIZIO DATI CESSIONARIO COMMITTENTE-->
                      <xsl:if test="a:FatturaElettronicaSemplificata/FatturaElettronicaHeader/CessionarioCommittente">
                        <div class="panel panel-primary">

                          <div class="panel-heading">
                            <h3 class="panel-title">Cliente (cessionario/committente)</h3>
                          </div>
                          <div class="panel-body">


                            <xsl:if test="a:FatturaElettronicaSemplificata/FatturaElettronicaHeader/CessionarioCommittente/DatiAnagrafici">
                              <h4>Dati anagrafici</h4>

                              <xsl:for-each select="a:FatturaElettronicaSemplificata/FatturaElettronicaHeader/CessionarioCommittente/DatiAnagrafici">
                                <xsl:if test="IdFiscaleIVA">

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
                              </xsl:for-each>

                            </xsl:if>


                            <xsl:if test="a:FatturaElettronicaSemplificata/FatturaElettronicaHeader/CessionarioCommittente/Sede">
                              <h4>Dati della sede</h4>


                              <xsl:for-each select="a:FatturaElettronicaSemplificata/FatturaElettronicaHeader/CessionarioCommittente/Sede">
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


                            <xsl:if test="a:FatturaElettronicaSemplificata/FatturaElettronicaHeader/CessionarioCommittente/StabileOrganizzazione">
                              <h4>Stabile organizzazione del cessionario / committente</h4>


                              <xsl:for-each select="a:FatturaElettronicaSemplificata/FatturaElettronicaHeader/CessionarioCommittente/StabileOrganizzazione">
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

                            <xsl:if test="a:FatturaElettronicaSemplificata/FatturaElettronicaHeader/CessionarioCommittente/RappresentanteFiscale">
                              <div id="rappresentante-fiscale">
                                <h4>Dati del rappresentante fiscale del cessionario / committente</h4>


                                <xsl:for-each select="a:FatturaElettronicaSemplificata/FatturaElettronicaHeader/CessionarioCommittente/RappresentanteFiscale">
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
                            <!--FINE DATI RAPPRESENTANTE FISCALE-->

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


            <xsl:for-each select="a:FatturaElettronicaSemplificata/FatturaElettronicaBody">

              <!--INIZIO DATI PAGAMENTO-->
              <xsl:if test="DatiPagamento">
                <div class="row">
                  <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">

                    <div class="panel panel-primary">
                      <div class="panel-heading">
                        <h3 class="panel-title">Modalita' di pagamento</h3>
                      </div>
                      <div class="panel-body">

                        <xsl:for-each select="DatiPagamento">
                          <xsl:if test="CondizioniPagamento">

                            <strong>Condizioni di pagamento:</strong>
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
                            <br />
                            <strong>Dettaglio pagamento</strong>

                            <xsl:for-each select="DettaglioPagamento">

                              <xsl:if test="Beneficiario">
                                <br />Beneficiario del pagamento:
                                <span>
                                  <xsl:value-of select="Beneficiario" />
                                </span>

                              </xsl:if>
                              <xsl:if test="ModalitaPagamento">
                                <br />Modalità:
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
                                  <xsl:when test="$MP=''">
                                  </xsl:when>
                                  <xsl:otherwise>
                                    <span>(!!! codice non previsto !!!)</span>
                                  </xsl:otherwise>
                                </xsl:choose>

                              </xsl:if>
                              <xsl:if test="DataRiferimentoTerminiPagamento">
                                <br />Decorrenza termini di pagamento:
                                <span>
                                  <xsl:value-of select="DataRiferimentoTerminiPagamento" />
                                </span>
                                <xsl:call-template name="FormatDate">
                                  <xsl:with-param name="DateTime" select="DataRiferimentoTerminiPagamento" />
                                </xsl:call-template>

                              </xsl:if>
                              <xsl:if test="GiorniTerminiPagamento">

                                <br />Termini di pagamento (in giorni):
                                <span>
                                  <xsl:value-of select="GiorniTerminiPagamento" />
                                </span>

                              </xsl:if>
                              <xsl:if test="DataScadenzaPagamento">
                                <br />Data scadenza pagamento:
                                <span>
                                  <xsl:value-of select="DataScadenzaPagamento" />
                                </span>
                                <xsl:call-template name="FormatDate">
                                  <xsl:with-param name="DateTime" select="DataScadenzaPagamento" />
                                </xsl:call-template>

                              </xsl:if>
                              <xsl:if test="ImportoPagamento">

                                Importo:
                                <span>
                                  <xsl:value-of select="ImportoPagamento" />
                                </span>

                              </xsl:if>
                              <xsl:if test="CodUfficioPostale">
                                <br />Codice Ufficio Postale:
                                <span>
                                  <xsl:value-of select="CodUfficioPostale" />
                                </span>

                              </xsl:if>
                              <xsl:if test="CognomeQuietanzante">
                                <br />Cognome del quietanzante:
                                <span>
                                  <xsl:value-of select="CognomeQuietanzante" />
                                </span>
                              </xsl:if>
                              <xsl:if test="NomeQuietanzante">
                                <br />Nome del quietanzante:
                                <span>
                                  <xsl:value-of select="NomeQuietanzante" />
                                </span>
                              </xsl:if>
                              <xsl:if test="CFQuietanzante">
                                <br />CF del quietanzante:
                                <span>
                                  <xsl:value-of select="CFQuietanzante" />
                                </span>
                              </xsl:if>
                              <xsl:if test="TitoloQuietanzante">
                                <br />Titolo del quietanzante:
                                <span>
                                  <xsl:value-of select="TitoloQuietanzante" />
                                </span>
                              </xsl:if>
                              <xsl:if test="IstitutoFinanziario">
                                <br />Istituto finanziario:
                                <span>
                                  <xsl:value-of select="IstitutoFinanziario" />
                                </span>
                              </xsl:if>
                              <xsl:if test="IBAN">
                                <br />Codice IBAN:
                                <span>
                                  <xsl:value-of select="IBAN" />
                                </span>
                              </xsl:if>
                              <xsl:if test="ABI">
                                <br />Codice ABI:
                                <span>
                                  <xsl:value-of select="ABI" />
                                </span>
                              </xsl:if>
                              <xsl:if test="CAB">
                                <br />Codice CAB:
                                <span>
                                  <xsl:value-of select="CAB" />
                                </span>
                              </xsl:if>
                              <xsl:if test="BIC">
                                <br />Codice BIC:
                                <span>
                                  <xsl:value-of select="BIC" />
                                </span>
                              </xsl:if>
                              <xsl:if test="ScontoPagamentoAnticipato">
                                <br />Sconto per pagamento anticipato:
                                <span>
                                  <xsl:value-of select="ScontoPagamentoAnticipato" />
                                </span>
                              </xsl:if>
                              <xsl:if test="DataLimitePagamentoAnticipato">
                                <br />Data limite per il pagamento anticipato:
                                <span>
                                  <xsl:value-of select="DataLimitePagamentoAnticipato" />
                                </span>
                                <xsl:call-template name="FormatDate">
                                  <xsl:with-param name="DateTime" select="DataLimitePagamentoAnticipato" />
                                </xsl:call-template>
                              </xsl:if>
                              <xsl:if test="PenalitaPagamentiRitardati">
                                <br />Penale per ritardato pagamento:
                                <span>
                                  <xsl:value-of select="PenalitaPagamentiRitardati" />
                                </span>
                              </xsl:if>
                              <xsl:if test="DataDecorrenzaPenale">
                                <br />Data di decorrenza della penale:
                                <span>
                                  <xsl:value-of select="DataDecorrenzaPenale" />
                                </span>
                                <xsl:call-template name="FormatDate">
                                  <xsl:with-param name="DateTime" select="DataDecorrenzaPenale" />
                                </xsl:call-template>
                              </xsl:if>
                              <xsl:if test="CodicePagamento">
                                <br />Codice pagamento:
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
                          <table class="table table-striped">
                            <tr>
                              <th>linea</th>
                              <th>Tipo</th>
                              <th>Codice</th>
                              <th>Descr</th>
                              <th>Qta</th>
                              <th>UdM</th>
                              <th>
                                Data<br />inizio
                              </th>
                              <th>
                                Data<br />fine
                              </th>
                              <th>
                                Prezzo<br />Unitario
                              </th>
                              <th>
                                Sconto<br />Maggiorazione
                              </th>
                              <th>
                                Prezzo<br />Totale
                              </th>
                              <th>
                                Aliquota<br />IVA
                              </th>
                              <th>Ritenuta</th>
                              <th>Natura</th>
                              <th>
                                Rif.<br />Amm.
                              </th>
                              <th>
                                Dati<br />Gest.
                              </th>
                            </tr>
                            <xsl:for-each select="DatiBeniServizi/DettaglioLinee">
                              <tr>

                                <td>
                                  <!--Nr. linea-->
                                  <span>
                                    <xsl:value-of select="NumeroLinea" />
                                  </span>
                                </td>

                                <td>
                                  <xsl:if test="TipoCessionePrestazione">

                                    <!--Tipo cessione/prestazione:-->
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
                                </td>

                                <td>
                                  <xsl:if test="CodiceArticolo">

                                    <h5>Codifica articolo</h5>
                                    <xsl:for-each select="CodiceArticolo">

                                      <xsl:if test="CodiceTipo">

                                        Tipo:
                                        <span>
                                          <xsl:value-of select="CodiceTipo" />
                                        </span>
                                        <br />
                                      </xsl:if>
                                      <xsl:if test="CodiceValore">

                                        Valore:
                                        <span>
                                          <xsl:value-of select="CodiceValore" />
                                        </span>
                                        <br />
                                      </xsl:if>

                                    </xsl:for-each>
                                    <br />
                                  </xsl:if>
                                </td>

                                <td>
                                  <xsl:if test="Descrizione">

                                    Descrizione bene/servizio:
                                    <span>
                                      <xsl:value-of select="Descrizione" />
                                    </span>
                                    <br />
                                  </xsl:if>
                                </td>

                                <td>
                                  <xsl:if test="Quantita">

                                    Quantità:
                                    <span>
                                      <xsl:value-of select="Quantita" />
                                    </span>
                                    <br />
                                  </xsl:if>
                                </td>

                                <td>
                                  <xsl:if test="UnitaMisura">

                                    Unità di misura:
                                    <span>
                                      <xsl:value-of select="UnitaMisura" />
                                    </span>
                                    <br />
                                  </xsl:if>
                                </td>

                                <td>
                                  <xsl:if test="DataInizioPeriodo">

                                    Data inizio periodo di riferimento:
                                    <span>
                                      <xsl:value-of select="DataInizioPeriodo" />
                                    </span>
                                    <xsl:call-template name="FormatDate">
                                      <xsl:with-param name="DateTime" select="DataInizioPeriodo" />
                                    </xsl:call-template>
                                    <br />
                                  </xsl:if>
                                </td>

                                <td>
                                  <xsl:if test="DataFinePeriodo">

                                    Data fine periodo di riferimento:
                                    <span>
                                      <xsl:value-of select="DataFinePeriodo" />
                                    </span>
                                    <xsl:call-template name="FormatDate">
                                      <xsl:with-param name="DateTime" select="DataFinePeriodo" />
                                    </xsl:call-template>
                                    <br />
                                  </xsl:if>
                                </td>

                                <td>
                                  <xsl:if test="PrezzoUnitario">

                                    Valore unitario:
                                    <span>
                                      <xsl:value-of select="PrezzoUnitario" />
                                    </span>
                                    <br />
                                  </xsl:if>
                                </td>

                                <td>
                                  <xsl:if test="ScontoMaggiorazione">

                                    <h5>Sconto/Maggiorazione</h5>

                                    <xsl:for-each select="ScontoMaggiorazione">

                                      <xsl:if test="Tipo">

                                        Tipo:
                                        <span>
                                          <xsl:value-of select="Tipo" />
                                        </span>
                                        <xsl:variable name="TSCM">
                                          <xsl:value-of select="Tipo" />
                                        </xsl:variable>
                                        <xsl:choose>
                                          <xsl:when test="$TSCM='SC'">

                                            (sconto)
                                          </xsl:when>
                                          <xsl:when test="$TSCM='MG'">

                                            (maggiorazione)
                                          </xsl:when>
                                          <xsl:otherwise>

                                            <span>(!!! codice non previsto !!!)</span>
                                          </xsl:otherwise>
                                        </xsl:choose>
                                        <br />
                                      </xsl:if>
                                      <xsl:if test="Percentuale">

                                        Percentuale (%):
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
                                    <br />
                                  </xsl:if>
                                </td>

                                <td>
                                  <xsl:if test="PrezzoTotale">

                                    Valore totale:
                                    <span>
                                      <xsl:value-of select="PrezzoTotale" />
                                    </span>
                                    <br />
                                  </xsl:if>
                                </td>

                                <td>
                                  <xsl:if test="AliquotaIVA">

                                    IVA (%):
                                    <span>
                                      <xsl:value-of select="AliquotaIVA" />
                                    </span>
                                    <br />
                                  </xsl:if>
                                </td>

                                <td>
                                  <xsl:if test="Ritenuta">

                                    Soggetta a ritenuta:
                                    <span>
                                      <xsl:value-of select="Ritenuta" />
                                    </span>
                                    <br />
                                  </xsl:if>
                                </td>

                                <td>
                                  <xsl:if test="Natura">

                                    Natura operazione:
                                    <span>
                                      <xsl:value-of select="Natura" />
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
                                      <xsl:otherwise>
                                        <span>(!!! codice non previsto !!!)</span>
                                      </xsl:otherwise>
                                    </xsl:choose>
                                    <br />
                                  </xsl:if>
                                </td>

                                <td>
                                  <xsl:if test="RiferimentoAmministrazione">

                                    Riferimento amministrativo/contabile:
                                    <span>
                                      <xsl:value-of select="RiferimentoAmministrazione" />
                                    </span>
                                    <br />
                                  </xsl:if>
                                </td>

                                <td>
                                  <xsl:if test="AltriDatiGestionali">

                                    <h5>Altri dati gestionali</h5>

                                    <xsl:for-each select="AltriDatiGestionali">
                                      <xsl:if test="TipoDato">

                                        Tipo dato:
                                        <span>
                                          <xsl:value-of select="TipoDato" />
                                        </span>
                                        <br />
                                      </xsl:if>
                                      <xsl:if test="RiferimentoTesto">

                                        Valore testo:
                                        <span>
                                          <xsl:value-of select="RiferimentoTesto" />
                                        </span>
                                        <br />
                                      </xsl:if>
                                      <xsl:if test="RiferimentoNumero">

                                        Valore numerico:
                                        <span>
                                          <xsl:value-of select="RiferimentoNumero" />
                                        </span>
                                        <br />
                                      </xsl:if>
                                      <xsl:if test="RiferimentoData">

                                        Valore data:
                                        <span>
                                          <xsl:value-of select="RiferimentoData" />
                                        </span>
                                        <xsl:call-template name="FormatDate">
                                          <xsl:with-param name="DateTime" select="RiferimentoData" />
                                        </xsl:call-template>
                                        <br />
                                      </xsl:if>
                                    </xsl:for-each>

                                    <br />
                                  </xsl:if>
                                </td>

                              </tr>
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
                          <h4>Dati di riepilogo per aliquota IVA e natura</h4>
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
                                <xsl:otherwise>
                                  <span>(!!! codice non previsto !!!)</span>
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

                              Totale imponibile/importo:
                              <span>
                                <xsl:value-of select="ImponibileImporto" />
                              </span>
                              <br />
                            </xsl:if>
                            <xsl:if test="Imposta">

                              Totale imposta:
                              <span>
                                <xsl:value-of select="Imposta" />
                              </span>
                              <br />
                            </xsl:if>
                            <xsl:if test="EsigibilitaIVA">

                              Esigibilità IVA:
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
                            </xsl:if>
                            <xsl:if test="RiferimentoNormativo">

                              Riferimento normativo:
                              <span>
                                <xsl:value-of select="RiferimentoNormativo" />
                              </span>
                              <br />
                            </xsl:if>

                          </xsl:for-each>
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
              <xsl:value-of select="count(a:FatturaElettronicaSemplificata/FatturaElettronicaBody)" />
            </xsl:variable>

            <xsl:for-each select="a:FatturaElettronicaSemplificata/FatturaElettronicaBody">

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

                            Numero fase avanzamento:
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

                            <!--</div>-->

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

                        </xsl:for-each>

                      </xsl:if>
                      <!--FINE ALLEGATI-->


                    </div>
                  </div>
                  <!--/panel panel-primary-->

                </div>
              </div>

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