package inventario.inventarioapi.model;

import java.time.LocalDateTime;
import java.time.LocalTime;

import jakarta.persistence.*;

//Campos: CODIGOVENDA;CODLOJA;O_V;EMISSAO;CODVENDEDOR;CODCLIENTE;VALORPROD;DESCONTO;ACRESCIMO;DESOUAC;TOTALVENDA;CUPOM;NOMECLI;CGCCPF;MAPA;OBSERVACAO;INTEREXTER;VAREJOATACADO;FRETE;CODPLANO;TXJUROS;NUMPARCELA;NUMDIAS;COMENTRADA;ESPECIAL;CAIXA;HORA;NOMEUSUARIO;DATABAIXCOM;SELECT_ATACADO;GEROU_NF_ATACADO;IMP_PED_ATACADO;NUMERO_NF;DATA_FATURAMENTO;LANCADO_FINA;DAT_LAN_FIN;COM_IND;CODIGODEP;SEQUENCIA;VALORPAGO;TROCO;CODIGOECFINFO;FPPDVBALCAO;ECF_COO;ORDEM_DESC_ACRES;TIPO_ARRED_TRUNC;ECF_FABRICACAO;DATA_IMP_CF;HORA_IMP_CF;EFD_IMP_VLLQITEM;CCF;CANCELADO;CHAVE_MD5;CHAVE_FAB;NUM_SEQ_ECF;LETRA_MF;MODELO;NUMERO_USUARIO;DESC_VALOR_PER;ACRE_VALOR_PER;VAL_CANC_ACR_ST;TOTAL_PIS;TOTAL_COFINS;TOTAL_ICMS_ST;CUPOM_FINALIZADO;DAV_NUMERO;PREVENDA_NUMERO;TIPO_DOCUMENTO;DAV_SERIE;PREVENDA_SERIE;DAV_CHAVE_MD5;PREVENDA_CHAVE_MD5;CNPJ_ESTABELECIMENTO;DAV_TITULO;TIPO_ECF;MARCA_ECF;COO_GERENCIAL_DAV;PREVENDA_IMPORTACAO_AUTOMATICA;PRONTA_PARA_UPLOAD;MD5_VENDA_OFF;CODIGOVENDA_OFF;CODIGOVENDA_ONN;SEQUENCIA_GERADA_OFF;DESCONTO_NO_TROCO;GERAR_EFD;VBC;TOTALICMS;VBCST;VALOR_PIS;VALOR_COFINS;VALOR_CREDITO_SN;MODELO_DOCUMENTO;NUMERO_NFCE;EMISSAO_NFCE;SERIE_NFCE;VALOR_OUTRAS_DESPESAS;TC_VENDA_TRANSACTION_CENTRE;SITUACAO_IMPORTACAO;TROCO_SC;CNPJ_ADM_TROCO_SC;MD5_REGISTRO_H2;CNPJ_DOACAO_TROCO;CONSUMIDOR_FINAL;OR_VENDA_ORIZON;OR_NSU_TRANS_ORIZON;OR_NSU_HOST_ORIZON;OR_AUTORIZACAO_ORIZON;OR_SEQUENCIA_ORIZON;FLAG_DAV;VD_SEQUENCIA_VIDALINK;VD_VENDA_VIDALINK;VD_TIPO_AUTORIZACAO_VIDALINK;VD_AUTORIZACAO_VIDALINK;FUN_VENDA_FUNCIONAL;FUN_NSU_TRANS_FUNCIONAL;FUN_AUTORIZACAO_FUNCIONAL;DATA_IMPRESSAO_ECF_DAV;CHAVE_MD5_J1;QUANTIDADE_IMPRESSAO_DAV;CODMAPACARGA;CLUBE_PROMOCOES;CLUBE_PROMOCOES_RETORNO_ENVIO;CLUBE_PROMOCOES_STATUS;SERIE_NF;ESTOQUE_ENTREGA_PARCIAL;STATUS_FEEDBACK;OBSERVACAO_FEEDBACK;CONTROLECAIXA_MD5_VENDA_OFF;CODCONTROLECAIXA;GUID_VENDA_EXTERNA;VDESCONTO_REGRA_ICMS;IDSCE;IDTROCOSIMPLES;VALOR_TROCO_SIMPLES;TIPOTROCOSIMPLES;ENTREGUE_MU_ESTOQUE;USO_CONSUMO;CODIGO_BENS;QBCMono;VICMSMono;QBCMonoReten;VICMSMonoReten;QBCMonoRet;VICMSMonoRet;IDVENDA_Easy;SITUACAO_EasyLog;TIPO_ENTREGA;SICRONIZACAO_EasyLog;STATUS_ENTREGA

@Entity
@Table(name = "NVENDA2")
public class NVenda {
    @Id
    @Column(name = "CODIGOVENDA")
    private Long codigoVenda;

    @ManyToOne
    @JoinColumn(name = "CODLOJA")
    private Empresa loja;

    @Column(name = "O_V" )
    private String oV;

    @Column(name = "EMISSAO")
    private String emissao;

    @Column(name = "CODVENDEDOR")
    private Long codVendedor;   

    @Column(name = "CODCLIENTE") //0
    private Long codCliente;

    @Column(name = "VALORPROD")
    private Double valorProd;

    @Column(name = "DESCONTO")
    private Double desconto;

    @Column(name = "ACRESCIMO")
    private Double acrescimo;

    @Column(name = "DESOUAC")
    private String desouac;

    @Column(name = "TOTALVENDA")
    private Double totalVenda;

    @Column(name = "CUPOM")
    private String cupom;

    @Column(name = "NOMECLI")
    private String nomeCli;

    @Column(name = "CGCCPF")
    private String cgcCpf;

    @Column(name = "MAPA")
    private String mapa;

    @Column(name = "OBSERVACAO")
    private String observacao;  

    @Column(name = "INTEREXTER")
    private Double interExter;

    @Column(name = "VAREJOATACADO")
    private Double varejoAtacado;

    @Column(name = "FRETE")
    private Double frete;

    @Column(name = "CODPLANO")
    private Double codPlano;

    @Column(name = "TXJUROS")
    private Double txJuros;

    @Column(name = "NUMPARCELA")
    private Double numParcela;

    @Column(name = "NUMDIAS")
    private Double numDias;

    @Column(name = "COMENTRADA")
    private String comEntrada;

    @Column(name = "ESPECIAL")
    private String especial;

    @Column(name = "CAIXA")
    private Double caixa;

    @Column(name = "HORA")
    private String hora;

    @Column(name = "NOMEUSUARIO")
    private String nomeUsuario;

    @Column(name = "DATABAIXCOM")
    private LocalDateTime dataBaixCom;

    @Column(name = "SELECT_ATACADO")
    private String selectAtacado;   

    @Column(name = "GEROU_NF_ATACADO")
    private String gerouNfAtacado;

    @Column(name = "IMP_PED_ATACADO")
    private String impPedAtacado;

    @Column(name = "NUMERO_NF")
    private String numeroNf;

    @Column(name = "DATA_FATURAMENTO")
    private LocalDateTime dataFaturamento;

    @Column(name = "LANCADO_FINA")
    private String lancadoFina;

    @Column(name = "DAT_LAN_FIN")
    private LocalDateTime datLanFin;

    @Column(name = "COM_IND")
    private String comInd;

    @Column(name = "SEQUENCIA")
    private Long sequencia;

    @Column(name = "CODIGODEP")
    private Long codigodep;

    @Column(name = "VALORPAGO")
    private Double valorPago;

    @Column(name = "TROCO")
    private Double troco;

    @Column(name = "CODIGOECFINFO")
    private String codigoEcfInfo;

    @Column(name = "FPPDVBALCAO")
    private String fppdvBalcao;

    @Column(name = "ECF_COO")
    private Double ecfCoo;

    @Column(name = "ORDEM_DESC_ACRES")
    private String ordemDescAcres;

    @Column(name = "TIPO_ARRED_TRUNC")
    private String tipoArredTrunc;

    @Column(name = "ECF_FABRICACAO")
    private String ecfFabricacao;

    @Column(name = "DATA_IMP_CF")
    private LocalDateTime dataImpCf;

    @Column(name = "HORA_IMP_CF")
    private String horaImpCf;

    @Column(name = "EFD_IMP_VLLQITEM")
    private String efdImpVllqItem;

    @Column(name = "CCF")
    private Double ccf;

    @Column(name = "CANCELADO")
    private String cancelado;

    @Column(name = "CHAVE_MD5")
    private String chaveMd5;

    @Column(name = "CHAVE_FAB")
    private String chaveFab;

    @Column(name = "NUM_SEQ_ECF")
    private Long numSeqEcf;

    @Column(name = "LETRA_MF")
    private String letraMf;

    @Column(name = "MODELO")
    private String modelo;

    @Column(name = "NUMERO_USUARIO")
    private Long numeroUsuario;

    @Column(name = "DESC_VALOR_PER")
    private String descValorPer;

    @Column(name = "ACRE_VALOR_PER")
    private String acreValorPer;

    @Column(name = "VAL_CANC_ACR_ST")
    private Double valCancAcrSt;

    @Column(name = "TOTAL_PIS")
    private Double totalPis;    

    @Column(name = "TOTAL_COFINS")
    private Double totalCofins;

    @Column(name = "GERAR_EFD")
    private String gerarEfd;

    @Column(name = "TOTAL_ICMS_ST")
    private Double totalIcmsSt;

    @Column(name = "CUPOM_FINALIZADO")
    private String cupomFinalizado;

    @Column(name = "DAV_NUMERO")
    private Long davNumero;

    @Column(name = "PREVENDA_NUMERO")
    private Double preVendaNumero;  

    @Column(name = "TIPO_DOCUMENTO")
    private String tipoDocumento;

    @Column(name = "DAV_SERIE")
    private int davSerie;

    @Column(name = "PREVENDA_SERIE")
    private int preVendaSerie;

    @Column(name = "DAV_CHAVE_MD5")
    private String davChaveMd5;

    @Column(name = "PREVENDA_CHAVE_MD5")
    private String preVendaChaveMd5;

    @Column(name = "CNPJ_ESTABELECIMENTO")
    private String cnpjEstabelecimento;

    @Column(name = "DAV_TITULO")
    private String davTitulo;

    @Column(name = "TIPO_ECF")
    private String tipoEcf;

    @Column(name = "MARCA_ECF")
    private String marcaEcf;

    @Column(name = "COO_GERENCIAL_DAV")
    private int cooGerencialDav;

    @Column(name = "PREVENDA_IMPORTACAO_AUTOMATICA")
    private String preVendaImportacaoAutomatica;

    @Column(name = "PRONTA_PARA_UPLOAD")
    private String prontaParaUpload;

    @Column(name = "MD5_VENDA_OFF")
    private String md5VendaOff;

    @Column(name = "CODIGOVENDA_OFF")
    private Long codigoVendaOff;

    @Column(name = "CODIGOVENDA_ONN")
    private Long codigoVendaOnn;

    @Column(name = "SEQUENCIA_GERADA_OFF")
    private Long sequenciaGeradaOff;

    @Column(name = "DESCONTO_NO_TROCO")
    private String descontoNoTroco;

    @Column(name = "VBC")
    private Double vbc; 

    @Column(name = "TOTALICMS")
    private Double totalIcms;

    @Column(name = "VBCST")
    private Double vbcst;

    @Column(name = "VALOR_PIS")
    private Double valorPis;

    @Column(name = "VALOR_COFINS")
    private Double valorCofins;

    @Column(name = "VALOR_CREDITO_SN")
    private Double valorCreditoSn;

    @Column(name = "MODELO_DOCUMENTO")
    private String modeloDocumento;

    @Column(name = "NUMERO_NFCE")   
    private Double numeroNfce;

    @Column(name = "EMISSAO_NFCE")
    private LocalDateTime emissaoNfce;

    @Column(name = "SERIE_NFCE")
    private Double serieNfce;

    @Column(name = "VALOR_OUTRAS_DESPESAS")
    private Double valorOutrasDespesas;

    @Column(name = "TC_VENDA_TRANSACTION_CENTRE")
    private String tcVendaTransactionCentre;

    @Column(name = "SITUACAO_IMPORTACAO")
    private int situacaoImportacao;

    @Column(name = "TROCO_SC")
    private Double trocoSc;

    @Column(name = "CNPJ_ADM_TROCO_SC")
    private String cnpjAdmTrocoSc;

    @Column(name = "MD5_REGISTRO_H2")
    private String md5RegistroH2;

    @Column(name = "CNPJ_DOACAO_TROCO")
    private String cnpjDoacaoTroco;

    @Column(name = "CONSUMIDOR_FINAL")
    private String consumidorFinal;

    @Column(name = "OR_VENDA_ORIZON")
    private String orVendaOrizon;

    @Column(name = "OR_NSU_HOST_ORIZON")    
    private String orNsuHostOrizon;

    @Column(name = "OR_NSU_TRANS_ORIZON")
    private String orNsuTransOrizon;

    @Column(name = "OR_AUTORIZACAO_ORIZON")
    private String orAutorizacaoOrizon;

    @Column(name = "OR_SEQUENCIA_ORIZON")
    private Double orSequenciaOrizon;

    @Column(name = "FLAG_DAV")
    private int flagDav;

    @Column(name = "VD_SEQUENCIA_VIDALINK")
    private Long vdSequenciaVidalink;

    @Column(name = "VD_VENDA_VIDALINK")
    private String vdVendaVidalink;

    @Column(name = "VD_TIPO_AUTORIZACAO_VIDALINK")
    private String vdTipoAutorizacaoVidalink;

    @Column(name = "VD_AUTORIZACAO_VIDALINK")
    private String vdAutorizacaoVidalink;

    @Column(name = "FUN_VENDA_FUNCIONAL")
    private String funVendaFuncional;

    @Column(name = "FUN_NSU_TRANS_FUNCIONAL")
    private String funNsuTransFuncional;

    @Column(name = "FUN_AUTORIZACAO_FUNCIONAL")
    private String funAutorizacaoFuncional;

    @Column(name = "DATA_IMPRESSAO_ECF_DAV")
    private LocalDateTime dataImpressaoEcfDav;

    @Column(name = "CHAVE_MD5_J1")
    private String chaveMd5J1;

    @Column(name = "QUANTIDADE_IMPRESSAO_DAV")
    private int quantidadeImpressaoDav;

    @Column(name = "CODMAPACARGA")
    private Long codMapaCarga;

    @Column(name = "CLUBE_PROMOCOES")
    private String clubePromocoes;

    @Column(name = "CLUBE_PROMOCOES_RETORNO_ENVIO")
    private int clubePromocoesRetornoEnvio;

    @Column(name = "CLUBE_PROMOCOES_STATUS")
    private int clubePromocoesStatus;

    @Column(name = "SERIE_NF")
    private String serieNf;

    @Column(name = "ESTOQUE_ENTREGA_PARCIAL")
    private String estoqueEntregaParcial;

    @Column(name = "STATUS_FEEDBACK")
    private int statusFeedback;

    @Column(name = "OBSERVACAO_FEEDBACK")
    private String observacaoFeedback;

    @Column(name = "CONTROLECAIXA_MD5_VENDA_OFF")
    private String controleCaixaMd5VendaOff;

    @Column(name = "CODCONTROLECAIXA")
    private Long codControleCaixa;

    @Column(name = "GUID_VENDA_EXTERNA")
    private String guidVendaExterna;

    @Column(name = "VDESCONTO_REGRA_ICMS")
    private Double vDescontoRegraIcms;

    @Column(name = "IDSCE")
    private String idsce;

    @Column(name = "IDTROCOSIMPLES")
    private String idTrocoSimples;

    @Column(name = "VALOR_TROCO_SIMPLES")
    private Double valorTrocoSimples;

    @Column(name = "TIPOTROCOSIMPLES")
    private int tipoTrocoSimples;

    @Column(name = "ENTREGUE_MU_ESTOQUE")
    private String entregueMuEstoque;

    @Column(name = "USO_CONSUMO")
    private int usoConsumo;

    @Column(name = "CODIGO_BENS")
    private int codigoBens;

    @Column(name = "QBCMono")
    private Double qbcMono;

    @Column(name = "VICMSMono")
    private Double vicmsMono;

    @Column(name = "QBCMonoReten")
    private Double qbcMonoReten;

    @Column(name = "VICMSMonoReten")
    private Double vicmsMonoReten;

    @Column(name = "QBCMonoRet")
    private Double qbcMonoRet;

    @Column(name = "VICMSMonoRet")
    private Double vicmsMonoRet;

    @Column(name = "IDVENDA_Easy")
    private String idVendaEasy;

    @Column(name = "SITUACAO_EasyLog")
    private int situacaoEasyLog;

    @Column(name = "TIPO_ENTREGA")
    private int tipoEntrega;

    @Column(name = "SICRONIZACAO_EasyLog")
    private int sicronizacaoEasyLog;

    @Column(name = "STATUS_ENTREGA")
    private int statusEntrega;

    public NVenda(Long codigo, Empresa loja, String hora, String emissao, Long codVendedor, Double valorProd, Double totalVenda, String nomeCli, Long sequencia, Long davNumero, String nomeUsuario) {
        this.codigoVenda = codigo;
        this.loja = loja;
        this.emissao = emissao;
        this.codVendedor = codVendedor;
        this.valorProd = valorProd;
        this.totalVenda = valorProd; // Inicializa totalVenda com valorProd
        this.nomeCli = nomeCli;
        this.sequencia = sequencia;
        this.davNumero = davNumero;
        this.mapa = emissao; //mapa é a mesma data da emissao
        this.hora = hora;
        this.nomeUsuario = nomeUsuario;
        this.oV = "1";
        this.codCliente = 0L;
        this.desconto = 0.0;
        this.desouac = "0";
        this.acrescimo = 0.0;
        this.cupom = null;
        this.cgcCpf = null;
        this.observacao = null;
        this.interExter = 1.0;
        this.varejoAtacado = 1.0;
        this.frete = 0.0;
        this.codPlano = 1.0;
        this.txJuros = 0.0;
        this.numParcela = 1.0;
        this.numDias = 0.0;
        this.comEntrada = "N";
        this.especial = "B";
        this.caixa = 1.0;
        this.dataBaixCom = null;
        this.selectAtacado = "0";
        this.gerouNfAtacado = "Nao";
        this.impPedAtacado = "Nao";
        this.numeroNf = "0";
        this.dataFaturamento = null;
        this.lancadoFina = "Nao";
        this.datLanFin = null;
        this.comInd = "1";
        this.codigodep = 0L;
        this.sequencia = this.codigoVenda;
        this.valorPago = 0.0;
        this.troco = 0.0;
        this.codigoEcfInfo = "0";
        this.fppdvBalcao = "2";
        this.ecfCoo = 0.0;
        this.ordemDescAcres = null;
        this.tipoArredTrunc = null;
        this.ecfFabricacao = null;
        this.dataImpCf = null;
        this.horaImpCf = null;
        this.efdImpVllqItem = "N";
        this.ccf = 0.0;
        this.cancelado = "N";
        this.chaveMd5 = null;
        this.chaveFab = null;
        this.numSeqEcf = 1L;
        this.letraMf = null;
        this.modelo = null;
        this.numeroUsuario = 1L; //????
        this.descValorPer = "V";
        this.acreValorPer = "V";
        this.valCancAcrSt = 0.0;
        this.totalPis = 0.0;
        this.totalCofins = 0.0;
        this.totalIcmsSt = 0.0;
        this.cupomFinalizado = null;
        this.davNumero = this.codigoVenda;
        this.preVendaNumero = 0.0;
        this.tipoDocumento = "DAV"; 
        this.davSerie = 0;
        this.preVendaNumero = 0.0;
        // this.davChaveMd5????
        // this.cnpjEstabelecimento????
        this.davTitulo = "DAV";
        this.tipoEcf = null;
        this.marcaEcf = null;
        this.cooGerencialDav = 0;
        this.preVendaImportacaoAutomatica = null;
        this.prontaParaUpload = "N";
        this.md5VendaOff = null;
        this.codigoVendaOff = 0L;
        this.codigoVendaOnn = 0L;
        this.sequenciaGeradaOff = null;
        this.descontoNoTroco = "N";
        this.gerarEfd = null;
        this.vbc = 0.0;
        this.totalIcms = 0.0;
        this.vbcst = 0.0;
        this.valorPis = 0.0;
        this.valorCofins = 0.0;
        this.valorCreditoSn = 0.0;
        this.modeloDocumento = null;
        this.numeroNfce = 0.0;
        this.emissaoNfce = null;
        this.serieNfce = 0.0;
        this.valorOutrasDespesas = 0.0;
        this.tcVendaTransactionCentre = "N";
        this.situacaoImportacao = 0;
        this.trocoSc = 0.0;
        this.cnpjAdmTrocoSc = null;
        this.md5RegistroH2 = null;
        this.cnpjDoacaoTroco = null;
        this.consumidorFinal = "1";
        this.orVendaOrizon = "N";
        this.orNsuTransOrizon = null;
        this.orNsuHostOrizon = null;
        this.orAutorizacaoOrizon = null;
        this.orSequenciaOrizon = 0.0;
        this.flagDav = 10;
        this.vdSequenciaVidalink = 0L;
        this.vdVendaVidalink = null;
        this.vdTipoAutorizacaoVidalink = null;
        this.vdAutorizacaoVidalink = null;
        this.funVendaFuncional = null;
        this.funNsuTransFuncional = null;
        this.funAutorizacaoFuncional = null;
        this.dataImpressaoEcfDav = null;
        this.chaveMd5J1 = null;
        this.quantidadeImpressaoDav = (Integer) null;
        this.codMapaCarga = 0L;
        this.clubePromocoes = null;
        this.clubePromocoesRetornoEnvio = 0;
        this.clubePromocoesStatus = 0;
        this.serieNf = "0";
        this.estoqueEntregaParcial = null;
        this.statusFeedback = (Integer) null;
        this.observacaoFeedback = null;
        this.controleCaixaMd5VendaOff = null;
        this.codControleCaixa = 0L;
        this.guidVendaExterna = null;
        this.vDescontoRegraIcms = 0.0;
        this.idsce = null;
        this.idTrocoSimples = null;
        this.valorTrocoSimples = 0.0;
        this.tipoTrocoSimples = 0;
        this.entregueMuEstoque = null;
        this.usoConsumo = 0;
        this.codigoBens = 0;
        this.qbcMono = 0.0;
        this.vicmsMono = 0.0;
        this.qbcMonoReten = 0.0;
        this.vicmsMonoReten = 0.0;
        this.idVendaEasy = null;
        this.situacaoEasyLog = 1;
        this.tipoEntrega = 0;
        this.sicronizacaoEasyLog = 0;
        this.statusEntrega = 0;
    }

    public Long getCodigoVenda() {
        return codigoVenda;
    }

    public void setCodigoVenda(Long codigoVenda) {
        this.codigoVenda = codigoVenda;
    }

    public Empresa getLoja() {
        return loja;
    }

    public void setLoja(Empresa loja) {
        this.loja = loja;
    }

    public String getoV() {
        return oV;
    }

    public void setoV(String oV) {
        this.oV = oV;
    }

    public String getEmissao() {
        return emissao;
    }

    public void setEmissao(String emissao) {
        this.emissao = emissao;
    }

    public Long getCodVendedor() {
        return codVendedor;
    }

    public void setCodVendedor(Long codVendedor) {
        this.codVendedor = codVendedor;
    }

    public Long getCodCliente() {
        return codCliente;
    }

    public void setCodCliente(Long codCliente) {
        this.codCliente = codCliente;
    }

    public Double getValorProd() {
        return valorProd;
    }

    public void setValorProd(Double valorProd) {
        this.valorProd = valorProd;
    }

    public Double getDesconto() {
        return desconto;
    }

    public void setDesconto(Double desconto) {
        this.desconto = desconto;
    }

    public Double getAcrescimo() {
        return acrescimo;
    }

    public void setAcrescimo(Double acrescimo) {
        this.acrescimo = acrescimo;
    }

    public String getDesouac() {
        return desouac;
    }

    public void setDesouac(String desouac) {
        this.desouac = desouac;
    }

    public Double getTotalVenda() {
        return totalVenda;
    }

    public void setTotalVenda(Double totalVenda) {
        this.totalVenda = totalVenda;
    }

    public String getCupom() {
        return cupom;
    }

    public void setCupom(String cupom) {
        this.cupom = cupom;
    }

    public String getNomeCli() {
        return nomeCli;
    }

    public void setNomeCli(String nomeCli) {
        this.nomeCli = nomeCli;
    }

    public String getCgcCpf() {
        return cgcCpf;
    }

    public void setCgcCpf(String cgcCpf) {
        this.cgcCpf = cgcCpf;
    }

    public String getMapa() {
        return mapa;
    }

    public void setMapa(String mapa) {
        this.mapa = mapa;
    }

    public String getObservacao() {
        return observacao;
    }

    public void setObservacao(String observacao) {
        this.observacao = observacao;
    }

    public Double getInterExter() {
        return interExter;
    }

    public void setInterExter(Double interExter) {
        this.interExter = interExter;
    }

    public Double getVarejoAtacado() {
        return varejoAtacado;
    }

    public void setVarejoAtacado(Double varejoAtacado) {
        this.varejoAtacado = varejoAtacado;
    }

    public Double getFrete() {
        return frete;
    }

    public void setFrete(Double frete) {
        this.frete = frete;
    }

    public Double getCodPlano() {
        return codPlano;
    }

    public void setCodPlano(Double codPlano) {
        this.codPlano = codPlano;
    }

    public Double getTxJuros() {
        return txJuros;
    }

    public void setTxJuros(Double txJuros) {
        this.txJuros = txJuros;
    }

    public Double getNumParcela() {
        return numParcela;
    }

    public void setNumParcela(Double numParcela) {
        this.numParcela = numParcela;
    }

    public Double getNumDias() {
        return numDias;
    }

    public void setNumDias(Double numDias) {
        this.numDias = numDias;
    }

    public String getComEntrada() {
        return comEntrada;
    }

    public void setComEntrada(String comEntrada) {
        this.comEntrada = comEntrada;
    }

    public String getEspecial() {
        return especial;
    }

    public void setEspecial(String especial) {
        this.especial = especial;
    }

    public Double getCaixa() {
        return caixa;
    }

    public void setCaixa(Double caixa) {
        this.caixa = caixa;
    }

    public String getHora() {
        return hora;
    }

    public void setHora(String hora) {
        this.hora = hora;
    }

    public String getNomeUsuario() {
        return nomeUsuario;
    }

    public void setNomeUsuario(String nomeUsuario) {
        this.nomeUsuario = nomeUsuario;
    }

    public LocalDateTime getDataBaixCom() {
        return dataBaixCom;
    }

    public void setDataBaixCom(LocalDateTime dataBaixCom) {
        this.dataBaixCom = dataBaixCom;
    }

    public String getSelectAtacado() {
        return selectAtacado;
    }

    public void setSelectAtacado(String selectAtacado) {
        this.selectAtacado = selectAtacado;
    }

    public String getGerouNfAtacado() {
        return gerouNfAtacado;
    }

    public void setGerouNfAtacado(String gerouNfAtacado) {
        this.gerouNfAtacado = gerouNfAtacado;
    }

    public String getImpPedAtacado() {
        return impPedAtacado;
    }

    public void setImpPedAtacado(String impPedAtacado) {
        this.impPedAtacado = impPedAtacado;
    }

    public String getNumeroNf() {
        return numeroNf;
    }

    public void setNumeroNf(String numeroNf) {
        this.numeroNf = numeroNf;
    }

    public LocalDateTime getDataFaturamento() {
        return dataFaturamento;
    }

    public void setDataFaturamento(LocalDateTime dataFaturamento) {
        this.dataFaturamento = dataFaturamento;
    }

    public String getLancadoFina() {
        return lancadoFina;
    }

    public void setLancadoFina(String lancadoFina) {
        this.lancadoFina = lancadoFina;
    }

    public LocalDateTime getDatLanFin() {
        return datLanFin;
    }

    public void setDatLanFin(LocalDateTime datLanFin) {
        this.datLanFin = datLanFin;
    }

    public String getComInd() {
        return comInd;
    }

    public void setComInd(String comInd) {
        this.comInd = comInd;
    }

    public Long getSequencia() {
        return sequencia;
    }

    public void setSequencia(Long sequencia) {
        this.sequencia = sequencia;
    }

    public Long getCodigodep() {
        return codigodep;
    }

    public void setCodigodep(Long codigodep) {
        this.codigodep = codigodep;
    }

    public Double getValorPago() {
        return valorPago;
    }

    public void setValorPago(Double valorPago) {
        this.valorPago = valorPago;
    }

    public Double getTroco() {
        return troco;
    }

    public void setTroco(Double troco) {
        this.troco = troco;
    }

    public String getCodigoEcfInfo() {
        return codigoEcfInfo;
    }

    public void setCodigoEcfInfo(String codigoEcfInfo) {
        this.codigoEcfInfo = codigoEcfInfo;
    }

    public String getFppdvBalcao() {
        return fppdvBalcao;
    }

    public void setFppdvBalcao(String fppdvBalcao) {
        this.fppdvBalcao = fppdvBalcao;
    }

    public Double getEcfCoo() {
        return ecfCoo;
    }

    public void setEcfCoo(Double ecfCoo) {
        this.ecfCoo = ecfCoo;
    }

    public String getOrdemDescAcres() {
        return ordemDescAcres;
    }

    public void setOrdemDescAcres(String ordemDescAcres) {
        this.ordemDescAcres = ordemDescAcres;
    }

    public String getTipoArredTrunc() {
        return tipoArredTrunc;
    }

    public void setTipoArredTrunc(String tipoArredTrunc) {
        this.tipoArredTrunc = tipoArredTrunc;
    }

    public String getEcfFabricacao() {
        return ecfFabricacao;
    }

    public void setEcfFabricacao(String ecfFabricacao) {
        this.ecfFabricacao = ecfFabricacao;
    }

    public LocalDateTime getDataImpCf() {
        return dataImpCf;
    }

    public void setDataImpCf(LocalDateTime dataImpCf) {
        this.dataImpCf = dataImpCf;
    }

    public String getHoraImpCf() {
        return horaImpCf;
    }

    public void setHoraImpCf(String horaImpCf) {
        this.horaImpCf = horaImpCf;
    }

    public String getEfdImpVllqItem() {
        return efdImpVllqItem;
    }

    public void setEfdImpVllqItem(String efdImpVllqItem) {
        this.efdImpVllqItem = efdImpVllqItem;
    }

    public Double getCcf() {
        return ccf;
    }

    public void setCcf(Double ccf) {
        this.ccf = ccf;
    }

    public String getCancelado() {
        return cancelado;
    }

    public void setCancelado(String cancelado) {
        this.cancelado = cancelado;
    }

    public String getChaveMd5() {
        return chaveMd5;
    }

    public void setChaveMd5(String chaveMd5) {
        this.chaveMd5 = chaveMd5;
    }

    public String getChaveFab() {
        return chaveFab;
    }

    public void setChaveFab(String chaveFab) {
        this.chaveFab = chaveFab;
    }

    public Long getNumSeqEcf() {
        return numSeqEcf;
    }

    public void setNumSeqEcf(Long numSeqEcf) {
        this.numSeqEcf = numSeqEcf;
    }

    public String getLetraMf() {
        return letraMf;
    }

    public void setLetraMf(String letraMf) {
        this.letraMf = letraMf;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }

    public Long getNumeroUsuario() {
        return numeroUsuario;
    }

    public void setNumeroUsuario(Long numeroUsuario) {
        this.numeroUsuario = numeroUsuario;
    }

    public String getDescValorPer() {
        return descValorPer;
    }

    public void setDescValorPer(String descValorPer) {
        this.descValorPer = descValorPer;
    }

    public String getAcreValorPer() {
        return acreValorPer;
    }

    public void setAcreValorPer(String acreValorPer) {
        this.acreValorPer = acreValorPer;
    }

    public Double getValCancAcrSt() {
        return valCancAcrSt;
    }

    public void setValCancAcrSt(Double valCancAcrSt) {
        this.valCancAcrSt = valCancAcrSt;
    }

    public Double getTotalPis() {
        return totalPis;
    }

    public void setTotalPis(Double totalPis) {
        this.totalPis = totalPis;
    }

    public Double getTotalCofins() {
        return totalCofins;
    }

    public void setTotalCofins(Double totalCofins) {
        this.totalCofins = totalCofins;
    }

    public String getGerarEfd() {
        return gerarEfd;
    }

    public void setGerarEfd(String gerarEfd) {
        this.gerarEfd = gerarEfd;
    }

    public Double getTotalIcmsSt() {
        return totalIcmsSt;
    }

    public void setTotalIcmsSt(Double totalIcmsSt) {
        this.totalIcmsSt = totalIcmsSt;
    }

    public String getCupomFinalizado() {
        return cupomFinalizado;
    }

    public void setCupomFinalizado(String cupomFinalizado) {
        this.cupomFinalizado = cupomFinalizado;
    }

    public Long getDavNumero() {
        return davNumero;
    }

    public void setDavNumero(Long davNumero) {
        this.davNumero = davNumero;
    }

    public Double getPreVendaNumero() {
        return preVendaNumero;
    }

    public void setPreVendaNumero(Double preVendaNumero) {
        this.preVendaNumero = preVendaNumero;
    }

    public String getTipoDocumento() {
        return tipoDocumento;
    }

    public void setTipoDocumento(String tipoDocumento) {
        this.tipoDocumento = tipoDocumento;
    }

    public int getDavSerie() {
        return davSerie;
    }

    public void setDavSerie(int davSerie) {
        this.davSerie = davSerie;
    }

    public int getPreVendaSerie() {
        return preVendaSerie;
    }

    public void setPreVendaSerie(int preVendaSerie) {
        this.preVendaSerie = preVendaSerie;
    }

    public String getDavChaveMd5() {
        return davChaveMd5;
    }

    public void setDavChaveMd5(String davChaveMd5) {
        this.davChaveMd5 = davChaveMd5;
    }

    public String getPreVendaChaveMd5() {
        return preVendaChaveMd5;
    }

    public void setPreVendaChaveMd5(String preVendaChaveMd5) {
        this.preVendaChaveMd5 = preVendaChaveMd5;
    }

    public String getCnpjEstabelecimento() {
        return cnpjEstabelecimento;
    }

    public void setCnpjEstabelecimento(String cnpjEstabelecimento) {
        this.cnpjEstabelecimento = cnpjEstabelecimento;
    }

    public String getDavTitulo() {
        return davTitulo;
    }

    public void setDavTitulo(String davTitulo) {
        this.davTitulo = davTitulo;
    }

    public String getTipoEcf() {
        return tipoEcf;
    }

    public void setTipoEcf(String tipoEcf) {
        this.tipoEcf = tipoEcf;
    }

    public String getMarcaEcf() {
        return marcaEcf;
    }

    public void setMarcaEcf(String marcaEcf) {
        this.marcaEcf = marcaEcf;
    }

    public int getCooGerencialDav() {
        return cooGerencialDav;
    }

    public void setCooGerencialDav(int cooGerencialDav) {
        this.cooGerencialDav = cooGerencialDav;
    }

    public String getPreVendaImportacaoAutomatica() {
        return preVendaImportacaoAutomatica;
    }

    public void setPreVendaImportacaoAutomatica(String preVendaImportacaoAutomatica) {
        this.preVendaImportacaoAutomatica = preVendaImportacaoAutomatica;
    }

    public String getProntaParaUpload() {
        return prontaParaUpload;
    }

    public void setProntaParaUpload(String prontaParaUpload) {
        this.prontaParaUpload = prontaParaUpload;
    }

    public String getMd5VendaOff() {
        return md5VendaOff;
    }

    public void setMd5VendaOff(String md5VendaOff) {
        this.md5VendaOff = md5VendaOff;
    }

    public Long getCodigoVendaOff() {
        return codigoVendaOff;
    }

    public void setCodigoVendaOff(Long codigoVendaOff) {
        this.codigoVendaOff = codigoVendaOff;
    }

    public Long getCodigoVendaOnn() {
        return codigoVendaOnn;
    }

    public void setCodigoVendaOnn(Long codigoVendaOnn) {
        this.codigoVendaOnn = codigoVendaOnn;
    }

    public Long getSequenciaGeradaOff() {
        return sequenciaGeradaOff;
    }

    public void setSequenciaGeradaOff(Long sequenciaGeradaOff) {
        this.sequenciaGeradaOff = sequenciaGeradaOff;
    }

    public String getDescontoNoTroco() {
        return descontoNoTroco;
    }

    public void setDescontoNoTroco(String descontoNoTroco) {
        this.descontoNoTroco = descontoNoTroco;
    }

    public Double getVbc() {
        return vbc;
    }

    public void setVbc(Double vbc) {
        this.vbc = vbc;
    }

    public Double getTotalIcms() {
        return totalIcms;
    }

    public void setTotalIcms(Double totalIcms) {
        this.totalIcms = totalIcms;
    }

    public Double getVbcst() {
        return vbcst;
    }

    public void setVbcst(Double vbcst) {
        this.vbcst = vbcst;
    }

    public Double getValorPis() {
        return valorPis;
    }

    public void setValorPis(Double valorPis) {
        this.valorPis = valorPis;
    }

    public Double getValorCofins() {
        return valorCofins;
    }

    public void setValorCofins(Double valorCofins) {
        this.valorCofins = valorCofins;
    }

    public Double getValorCreditoSn() {
        return valorCreditoSn;
    }

    public void setValorCreditoSn(Double valorCreditoSn) {
        this.valorCreditoSn = valorCreditoSn;
    }

    public String getModeloDocumento() {
        return modeloDocumento;
    }

    public void setModeloDocumento(String modeloDocumento) {
        this.modeloDocumento = modeloDocumento;
    }

    public Double getNumeroNfce() {
        return numeroNfce;
    }

    public void setNumeroNfce(Double numeroNfce) {
        this.numeroNfce = numeroNfce;
    }

    public LocalDateTime getEmissaoNfce() {
        return emissaoNfce;
    }

    public void setEmissaoNfce(LocalDateTime emissaoNfce) {
        this.emissaoNfce = emissaoNfce;
    }

    public Double getSerieNfce() {
        return serieNfce;
    }

    public void setSerieNfce(Double serieNfce) {
        this.serieNfce = serieNfce;
    }

    public Double getValorOutrasDespesas() {
        return valorOutrasDespesas;
    }

    public void setValorOutrasDespesas(Double valorOutrasDespesas) {
        this.valorOutrasDespesas = valorOutrasDespesas;
    }

    public String getTcVendaTransactionCentre() {
        return tcVendaTransactionCentre;
    }

    public void setTcVendaTransactionCentre(String tcVendaTransactionCentre) {
        this.tcVendaTransactionCentre = tcVendaTransactionCentre;
    }

    public int getSituacaoImportacao() {
        return situacaoImportacao;
    }

    public void setSituacaoImportacao(int situacaoImportacao) {
        this.situacaoImportacao = situacaoImportacao;
    }

    public Double getTrocoSc() {
        return trocoSc;
    }

    public void setTrocoSc(Double trocoSc) {
        this.trocoSc = trocoSc;
    }

    public String getCnpjAdmTrocoSc() {
        return cnpjAdmTrocoSc;
    }

    public void setCnpjAdmTrocoSc(String cnpjAdmTrocoSc) {
        this.cnpjAdmTrocoSc = cnpjAdmTrocoSc;
    }

    public String getMd5RegistroH2() {
        return md5RegistroH2;
    }

    public void setMd5RegistroH2(String md5RegistroH2) {
        this.md5RegistroH2 = md5RegistroH2;
    }

    public String getCnpjDoacaoTroco() {
        return cnpjDoacaoTroco;
    }

    public void setCnpjDoacaoTroco(String cnpjDoacaoTroco) {
        this.cnpjDoacaoTroco = cnpjDoacaoTroco;
    }

    public String getConsumidorFinal() {
        return consumidorFinal;
    }

    public void setConsumidorFinal(String consumidorFinal) {
        this.consumidorFinal = consumidorFinal;
    }

    public String getOrVendaOrizon() {
        return orVendaOrizon;
    }

    public void setOrVendaOrizon(String orVendaOrizon) {
        this.orVendaOrizon = orVendaOrizon;
    }

    public String getOrNsuHostOrizon() {
        return orNsuHostOrizon;
    }

    public void setOrNsuHostOrizon(String orNsuHostOrizon) {
        this.orNsuHostOrizon = orNsuHostOrizon;
    }

    public String getOrNsuTransOrizon() {
        return orNsuTransOrizon;
    }

    public void setOrNsuTransOrizon(String orNsuTransOrizon) {
        this.orNsuTransOrizon = orNsuTransOrizon;
    }

    public String getOrAutorizacaoOrizon() {
        return orAutorizacaoOrizon;
    }

    public void setOrAutorizacaoOrizon(String orAutorizacaoOrizon) {
        this.orAutorizacaoOrizon = orAutorizacaoOrizon;
    }

    public Double getOrSequenciaOrizon() {
        return orSequenciaOrizon;
    }

    public void setOrSequenciaOrizon(Double orSequenciaOrizon) {
        this.orSequenciaOrizon = orSequenciaOrizon;
    }

    public int getFlagDav() {
        return flagDav;
    }

    public void setFlagDav(int flagDav) {
        this.flagDav = flagDav;
    }

    public Long getVdSequenciaVidalink() {
        return vdSequenciaVidalink;
    }

    public void setVdSequenciaVidalink(Long vdSequenciaVidalink) {
        this.vdSequenciaVidalink = vdSequenciaVidalink;
    }

    public String getVdVendaVidalink() {
        return vdVendaVidalink;
    }

    public void setVdVendaVidalink(String vdVendaVidalink) {
        this.vdVendaVidalink = vdVendaVidalink;
    }

    public String getVdTipoAutorizacaoVidalink() {
        return vdTipoAutorizacaoVidalink;
    }

    public void setVdTipoAutorizacaoVidalink(String vdTipoAutorizacaoVidalink) {
        this.vdTipoAutorizacaoVidalink = vdTipoAutorizacaoVidalink;
    }

    public String getVdAutorizacaoVidalink() {
        return vdAutorizacaoVidalink;
    }

    public void setVdAutorizacaoVidalink(String vdAutorizacaoVidalink) {
        this.vdAutorizacaoVidalink = vdAutorizacaoVidalink;
    }

    public String getFunVendaFuncional() {
        return funVendaFuncional;
    }

    public void setFunVendaFuncional(String funVendaFuncional) {
        this.funVendaFuncional = funVendaFuncional;
    }

    public String getFunNsuTransFuncional() {
        return funNsuTransFuncional;
    }

    public void setFunNsuTransFuncional(String funNsuTransFuncional) {
        this.funNsuTransFuncional = funNsuTransFuncional;
    }

    public String getFunAutorizacaoFuncional() {
        return funAutorizacaoFuncional;
    }

    public void setFunAutorizacaoFuncional(String funAutorizacaoFuncional) {
        this.funAutorizacaoFuncional = funAutorizacaoFuncional;
    }

    public LocalDateTime getDataImpressaoEcfDav() {
        return dataImpressaoEcfDav;
    }

    public void setDataImpressaoEcfDav(LocalDateTime dataImpressaoEcfDav) {
        this.dataImpressaoEcfDav = dataImpressaoEcfDav;
    }

    public String getChaveMd5J1() {
        return chaveMd5J1;
    }

    public void setChaveMd5J1(String chaveMd5J1) {
        this.chaveMd5J1 = chaveMd5J1;
    }

    public int getQuantidadeImpressaoDav() {
        return quantidadeImpressaoDav;
    }

    public void setQuantidadeImpressaoDav(int quantidadeImpressaoDav) {
        this.quantidadeImpressaoDav = quantidadeImpressaoDav;
    }

    public Long getCodMapaCarga() {
        return codMapaCarga;
    }

    public void setCodMapaCarga(Long codMapaCarga) {
        this.codMapaCarga = codMapaCarga;
    }

    public String getClubePromocoes() {
        return clubePromocoes;
    }

    public void setClubePromocoes(String clubePromocoes) {
        this.clubePromocoes = clubePromocoes;
    }

    public int getClubePromocoesRetornoEnvio() {
        return clubePromocoesRetornoEnvio;
    }

    public void setClubePromocoesRetornoEnvio(int clubePromocoesRetornoEnvio) {
        this.clubePromocoesRetornoEnvio = clubePromocoesRetornoEnvio;
    }

    public int getClubePromocoesStatus() {
        return clubePromocoesStatus;
    }

    public void setClubePromocoesStatus(int clubePromocoesStatus) {
        this.clubePromocoesStatus = clubePromocoesStatus;
    }

    public String getSerieNf() {
        return serieNf;
    }

    public void setSerieNf(String serieNf) {
        this.serieNf = serieNf;
    }

    public String getEstoqueEntregaParcial() {
        return estoqueEntregaParcial;
    }

    public void setEstoqueEntregaParcial(String estoqueEntregaParcial) {
        this.estoqueEntregaParcial = estoqueEntregaParcial;
    }

    public int getStatusFeedback() {
        return statusFeedback;
    }

    public void setStatusFeedback(int statusFeedback) {
        this.statusFeedback = statusFeedback;
    }

    public String getObservacaoFeedback() {
        return observacaoFeedback;
    }

    public void setObservacaoFeedback(String observacaoFeedback) {
        this.observacaoFeedback = observacaoFeedback;
    }

    public String getControleCaixaMd5VendaOff() {
        return controleCaixaMd5VendaOff;
    }

    public void setControleCaixaMd5VendaOff(String controleCaixaMd5VendaOff) {
        this.controleCaixaMd5VendaOff = controleCaixaMd5VendaOff;
    }

    public Long getCodControleCaixa() {
        return codControleCaixa;
    }

    public void setCodControleCaixa(Long codControleCaixa) {
        this.codControleCaixa = codControleCaixa;
    }

    public String getGuidVendaExterna() {
        return guidVendaExterna;
    }

    public void setGuidVendaExterna(String guidVendaExterna) {
        this.guidVendaExterna = guidVendaExterna;
    }

    public Double getvDescontoRegraIcms() {
        return vDescontoRegraIcms;
    }

    public void setvDescontoRegraIcms(Double vDescontoRegraIcms) {
        this.vDescontoRegraIcms = vDescontoRegraIcms;
    }

    public String getIdsce() {
        return idsce;
    }

    public void setIdsce(String idsce) {
        this.idsce = idsce;
    }

    public String getIdTrocoSimples() {
        return idTrocoSimples;
    }

    public void setIdTrocoSimples(String idTrocoSimples) {
        this.idTrocoSimples = idTrocoSimples;
    }

    public Double getValorTrocoSimples() {
        return valorTrocoSimples;
    }

    public void setValorTrocoSimples(Double valorTrocoSimples) {
        this.valorTrocoSimples = valorTrocoSimples;
    }

    public int getTipoTrocoSimples() {
        return tipoTrocoSimples;
    }

    public void setTipoTrocoSimples(int tipoTrocoSimples) {
        this.tipoTrocoSimples = tipoTrocoSimples;
    }

    public String getEntregueMuEstoque() {
        return entregueMuEstoque;
    }

    public void setEntregueMuEstoque(String entregueMuEstoque) {
        this.entregueMuEstoque = entregueMuEstoque;
    }

    public int getUsoConsumo() {
        return usoConsumo;
    }

    public void setUsoConsumo(int usoConsumo) {
        this.usoConsumo = usoConsumo;
    }

    public int getCodigoBens() {
        return codigoBens;
    }

    public void setCodigoBens(int codigoBens) {
        this.codigoBens = codigoBens;
    }

    public Double getQbcMono() {
        return qbcMono;
    }

    public void setQbcMono(Double qbcMono) {
        this.qbcMono = qbcMono;
    }

    public Double getVicmsMono() {
        return vicmsMono;
    }

    public void setVicmsMono(Double vicmsMono) {
        this.vicmsMono = vicmsMono;
    }

    public Double getQbcMonoReten() {
        return qbcMonoReten;
    }

    public void setQbcMonoReten(Double qbcMonoReten) {
        this.qbcMonoReten = qbcMonoReten;
    }

    public Double getVicmsMonoReten() {
        return vicmsMonoReten;
    }

    public void setVicmsMonoReten(Double vicmsMonoReten) {
        this.vicmsMonoReten = vicmsMonoReten;
    }

    public Double getQbcMonoRet() {
        return qbcMonoRet;
    }

    public void setQbcMonoRet(Double qbcMonoRet) {
        this.qbcMonoRet = qbcMonoRet;
    }

    public Double getVicmsMonoRet() {
        return vicmsMonoRet;
    }

    public void setVicmsMonoRet(Double vicmsMonoRet) {
        this.vicmsMonoRet = vicmsMonoRet;
    }

    public String getIdVendaEasy() {
        return idVendaEasy;
    }

    public void setIdVendaEasy(String idVendaEasy) {
        this.idVendaEasy = idVendaEasy;
    }

    public int getSituacaoEasyLog() {
        return situacaoEasyLog;
    }

    public void setSituacaoEasyLog(int situacaoEasyLog) {
        this.situacaoEasyLog = situacaoEasyLog;
    }

    public int getTipoEntrega() {
        return tipoEntrega;
    }

    public void setTipoEntrega(int tipoEntrega) {
        this.tipoEntrega = tipoEntrega;
    }

    public int getSicronizacaoEasyLog() {
        return sicronizacaoEasyLog;
    }

    public void setSicronizacaoEasyLog(int sicronizacaoEasyLog) {
        this.sicronizacaoEasyLog = sicronizacaoEasyLog;
    }

    public int getStatusEntrega() {
        return statusEntrega;
    }

    public void setStatusEntrega(int statusEntrega) {
        this.statusEntrega = statusEntrega;
    }

    



}
