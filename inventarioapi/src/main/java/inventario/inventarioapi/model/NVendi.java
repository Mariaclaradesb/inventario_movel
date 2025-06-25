package inventario.inventarioapi.model;

import jakarta.persistence.*;


//NUMVENDA;CODPRODUTO;QUANTIDADE;O_V;UNITARIO1;UNITARIO2;NVTOTAL;NPDESC;NPACRE;NCOMPOSTO;NPROMOCAO;DATA;CODCLIENTE;CODDEVOLUCAO;DATADEV;CODVENDEDOR;ITEM;VALORORIGINAL;TOTALIZADOR_PARCIAL;MU_UNIDADE;MU_ITEM;MU_QTE_MENORUN;CHAVE_MD5;CHAVE_FAB;FABRICACAO;CODIGO_PRO_SER;CANCELADO;CCF;COO;PRODUTO_SERVIDOR;CFOP;ALIQ_ICMS;ALIQ_ISS;DESCRICAO;UNIDADE;VALOR_DESCONTO;VALOR_ACRESCIMO;QTE_CANC_PARCIAL;VALOR_CANC_PARCIAL;VALOR_CANC_ACRESC;PRODUCAO;QTE_CASAS_DEC_QTE;QTE_CASAS_DEC_UNI;HORA_IMPRESSAO;PERC_PIS;PERC_COFINS;TOTAL_PIS;TOTAL_COFINS;TOTAL_ICMS;CST;COD_CSTCOFINS;COD_CSTPIS;ECF_VALORITEM;ECF_DESCONTO;ECF_ACRESCIMO;ECF_VALORITEMTOTAL;BASE_CALC_PIS;BASE_CALC_COFINS;MODO_SELECAO_TABPRECO;TAB_PRECO;ESPECIAL;ALIQ_TRIB_APROXIMADO;VALOR_TRIB_APROXIMADO;BAIXADO;VALOR_ICMS_ST;DAV_NUMERO;SITUACAO_TRIBUTARIA;PREVENDA_NUMERO;TIPO_DOCUMENTO;DAV_CHAVE_MD5;PREVENDA_CHAVE_MD5;LETRA_MF;MODELO;NUMERO_USUARIO;TIPO_ARRED_TRUNC;VENDA_PROMOCAO;CODIGO_PROMOCAO;PARTICIPA_MAPA;MODBC;VBC;PREDBC;MODBCST;PMVAST;PREDBCST;VBCST;PICMSST;ALIQUOTA_CREDITO_SN;VALOR_CREDITO_SN;PICMS;VICMS;VICMSST;ORIGEM_CST;CODFIGURA_ICMS_NFCE_DIFERIDO;QTD_ENTREGUE;VALOR_OUTRAS_DESPESAS;TC_VENDA_TRANSACTION_CENTRE;TC_PRECO_LIQUIDO_FARMACIA;ITEM_PROJETO;CODIGO_PROJETO;COD_AMBIENTE;COD_IDENTIFICADOR_ITEM_PROJETO;OR_VENDA_ORIZON;VD_VENDA_VIDALINK;FUN_VENDA_FUNCIONAL;CHAVE_MD5_J2;ALIQ_TRIB_APROXIMADO_UF;VALOR_TRIB_APROXIMADO_UF;ALIQ_TRIB_APROXIMADO_MU;VALOR_TRIB_APROXIMADO_MU;APLICAR_CEST;CLUBE_PROMOCOES_RESTANTE;CLUBE_PROMOCOES_DESCONTO;CLUBE_PROMOCOES_CODPROMOCAO;ATACAREJO;ATACAREJO_DESCONTO;PCO_COMPRA;C_AQUIS;PCO_LIQ;PCO_REMAR;PCO_02;PCO_03;PCO_04;LUCRO_BRUTO;LUCRO_REAL;COD_TINTOMETRICO_SCE;COD_TINTOMETRICO_ITEM_SCE;COR_TINTA;FABRICANTE_TINTA;FRETE;VDESCONTO_REGRA_ICMS;SALDO_ESTOQUE_VENDA_OFF;PERCENTUAL_DOTCOMPRAS;VALOR_DOTCOMPRAS;DESCRICAO_ALTERADA;QBCMono;VICMSMono;QBCMonoReten;VICMSMonoReten;QBCMonoRet;VICMSMonoRet;VALOR_DESC_RED_BASE;QUANTIDADE_ROMANEIO;DATA_ROMANEIO;USUARIO_ROMANEIO
@Entity
@Table(name = "NVENDI2")
public class NVendi {

    @EmbeddedId
    private NVendiId codigo;

    @ManyToOne
    @MapsId("codigoVenda")
    @JoinColumn(name = "NUMVENDA", referencedColumnName = "CODIGOVENDA")
    private NVenda nVenda;

    @ManyToOne
    @MapsId("codProduto")
    @JoinColumns({
        @JoinColumn(name = "CODPRODUTO", referencedColumnName = "CODIGO"),
        @JoinColumn(name = "CODLOJA", referencedColumnName = "CODLOJA")
    })
    private VProduto codProduto;

    @Column(name = "QUANTIDADE")
    private Double quantidade;

    @Column(name = "O_V")
    private String oV;

    @Column(name = "UNITARIO1")
    private Double unitario1;

    @Column(name = "UNITARIO2")
    private Double unitario2;

    @Column(name = "NVTOTAL")
    private Double nvtotal;

    @Column(name = "NPDESC")
    private Double npdesc;

    @Column(name = "NPACRE")
    private Double npacre;

    @Column(name = "NCOMPOSTO")
    private String ncomposto;

    @Column(name = "NPROMOCAO")
    private String npromocao;

    @Column(name = "DATA")
    private String data;

    @Column(name = "CODCLIENTE")
    private Long codcliente;

    @Column(name = "CODDEVOLUCAO")
    private Double coddevolucao;

    @Column(name = "DATADEV")
    private String datadev;

    @Column(name = "CODVENDEDOR")
    private Long codvendedor;

    @Column(name = "VALORORIGINAL")
    private Double valororiginal;

    @Column(name = "FRETE")
    private Double frete;

    @Column(name = "TOTALIZADOR_PARCIAL")
    private Double totalizadorParcial;

    @Column(name = "CHAVE_MD5")
    private String chaveMd5;

    @Column(name = "CHAVE_FAB")
    private String chaveFab;

    @Column(name = "FABRICACAO")
    private String fabricacao;

    @Column(name = "CODIGO_PRO_SER")
    private String codigoProSer;

    @Column(name = "CCF")
    private String ccf;

    @Column(name = "COO")
    private String coo;

    @Column(name = "VDESCONTO_REGRA_ICMS")
    private Double vdescontoRegraIcms;

    @Column(name = "SALDO_ESTOQUE_VENDA_OFF")
    private Double saldoEstoqueVendaOff;

    @Column(name = "PERCENTUAL_DOTCOMPRAS")
    private Double percentualDotCompras;

    @Column(name = "VALOR_DOTCOMPRAS")
    private Double valorDotCompras;

    @Column(name = "DESCRICAO")
    private String descricao;

    @Column(name = "DESCRICAO_ALTERADA")
    private String descricaoAlterada;

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

    @Column(name = "VALOR_DESC_RED_BASE")
    private Double valorDescRedBase;

    @Column(name = "QUANTIDADE_ROMANEIO")
    private Double quantidadeRomaneio;

    @Column(name = "DATA_ROMANEIO")
    private String dataRomaneio;

    @Column(name = "USUARIO_ROMANEIO")
    private String usuarioRomaneio;

    @Column(name = "MU_UNIDADE")
    private String muUnidade;

    @Column(name = "MU_ITEM")
    private Double muItem;

    @Column(name = "MU_QTE_MENORUN")
    private Double muQteMenorun;

    @Column(name = "CANCELADO")
    private String cancelado;

    @Column(name = "PRODUTO_SERVIDOR")
    private String produtoServidor;

    @Column(name = "CFOP")
    private String cfop;

    @Column(name = "ALIQ_ICMS")
    private Double aliqIcms;

    @Column(name = "ALIQ_ISS")
    private Double aliqIss;

    @Column(name = "UNIDADE")
    private String unidade;

    @Column(name = "VALOR_DESCONTO")
    private Double valorDesconto;

    @Column(name = "VALOR_ACRESCIMO")
    private Double valorAcrescimo;

    @Column(name = "QTE_CANC_PARCIAL")
    private Double qteCancParcial;

    @Column(name = "VALOR_CANC_PARCIAL")
    private Double valorCancParcial;

    @Column(name = "VALOR_CANC_ACRESC")
    private Double valorCancAcresc;

    @Column(name = "PRODUCAO")
    private String producao;

    @Column(name = "QTE_CASAS_DEC_QTE")
    private Double qteCasasDecQte;

    @Column(name = "QTE_CASAS_DEC_UNI")
    private Double qteCasasDecUni;

    @Column(name = "HORA_IMPRESSAO")
    private String horaImpressao;

    @Column(name = "PERC_PIS")
    private Double percPis;

    @Column(name = "PERC_COFINS")
    private Double percCofins;

    @Column(name = "TOTAL_PIS")
    private Double totalPis;

    @Column(name = "TOTAL_COFINS")
    private Double totalCofins;

    @Column(name = "TOTAL_ICMS")
    private Double totalIcms;

    @Column(name = "CST")
    private String cst;

    @Column(name = "COD_CSTCOFINS")
    private Double codCstcofins;

    @Column(name = "COD_CSTPIS")
    private Double codCstpis;

    @Column(name = "ECF_VALORITEM")
    private Double ecfValoritem;

    @Column(name = "ECF_DESCONTO")  
    private Double ecfDesconto;

    @Column(name = "ECF_ACRESCIMO")
    private Double ecfAcrescimo;

    @Column(name = "ECF_VALORITEMTOTAL")
    private Double ecfValoritemtotal;

    @Column(name = "BASE_CALC_PIS")
    private Double baseCalcPis;

    @Column(name = "BASE_CALC_COFINS")
    private Double baseCalcCofins;

    @Column(name = "MODO_SELECAO_TABPRECO")
    private String modoSelecaoTabPreco;

    @Column(name = "TAB_PRECO")
    private String tabPreco;

    @Column(name = "ESPECIAL")
    private String especial;

    @Column(name = "ALIQ_TRIB_APROXIMADO")
    private Double aliqTribAproximado;

    @Column(name = "VALOR_TRIB_APROXIMADO")
    private Double valorTribAproximado;

    @Column(name = "BAIXADO")
    private String baixado;

    @Column(name = "VALOR_ICMS_ST")
    private Double valorIcmsSt;

    @Column(name = "DAV_NUMERO")
    private String davNumero;

    @Column(name = "SITUACAO_TRIBUTARIA")
    private String situacaoTributaria;

    @Column(name = "PREVENDA_NUMERO")
    private Double prevendaNumero;

    @Column(name = "TIPO_DOCUMENTO")
    private String tipoDocumento;

    @Column(name = "DAV_CHAVE_MD5")
    private String davChaveMd5;

    @Column(name = "PREVENDA_CHAVE_MD5")
    private String prevendaChaveMd5;

    @Column(name = "LETRA_MF")
    private String letraMf;

    @Column(name = "MODELO")
    private String modelo;

    @Column(name = "NUMERO_USUARIO")
    private Long numeroUsuario;

    @Column(name = "TIPO_ARRED_TRUNC")
    private String tipoArredTrunc;

    @Column(name = "VENDA_PROMOCAO")
    private String vendaPromocao;

    @Column(name = "CODIGO_PROMOCAO")
    private Long codigoPromocao;

    @Column(name = "PARTICIPA_MAPA")
    private int participaMapa;

    @Column(name = "MODBC")
    private Double modbc;

    @Column(name = "VBC")
    private Double vbc;

    @Column(name = "PREDBC")
    private Double predbc;

    @Column(name = "MODBCST")
    private Double modbcst;

    @Column(name = "PMVAST")
    private Double pmvast;

    @Column(name = "PREDBCST")
    private Double predbcst;

    @Column(name = "VBCST")
    private Double vbcst;   

    @Column(name = "PICMSST")
    private Double picmsst;

    @Column(name = "ALIQUOTA_CREDITO_SN")
    private Double aliquotaCreditoSn;

    @Column(name = "VALOR_CREDITO_SN")
    private Double valorCreditoSn;

    @Column(name = "PICMS")
    private Double picms;

    @Column(name = "VICMS")
    private Double vicms;

    @Column(name = "VICMSST")
    private Double vicmsst;

    @Column(name = "ORIGEM_CST")
    private Double origemCst;

    @Column(name = "CODFIGURA_ICMS_NFCE_DIFERIDO")
    private Double codFiguraIcmsNfceDiferido;
    
    @Column(name = "QTD_ENTREGUE")
    private Double qtdEntregue;

    @Column(name = "VALOR_OUTRAS_DESPESAS")
    private Double valorOutrasDespesas;

    @Column(name = "TC_VENDA_TRANSACTION_CENTRE")
    private String tcVendaTransactionCentre;

    @Column(name = "TC_PRECO_LIQUIDO_FARMACIA")
    private Double tcPrecoLiquidoFarmacia;

    @Column(name = "ITEM_PROJETO")
    private String itemProjeto;

    @Column(name = "CODIGO_PROJETO")
    private Long codigoProjeto;

    @Column(name = "COD_AMBIENTE")
    private Long codAmbiente;

    @Column(name = "COD_IDENTIFICADOR_ITEM_PROJETO")
    private Long codIdentificadorItemProjeto;

    @Column(name = "OR_VENDA_ORIZON")
    private String orVendaOrizon;

    @Column(name = "VD_VENDA_VIDALINK")
    private String vdVendaVidalink;

    @Column(name = "FUN_VENDA_FUNCIONAL")
    private String funVendaFuncional;

    @Column(name = "CHAVE_MD5_J2")
    private String chaveMd5J2;

    @Column(name = "ALIQ_TRIB_APROXIMADO_UF")
    private Double aliqTribAproximadoUf;

    @Column(name = "VALOR_TRIB_APROXIMADO_UF")
    private Double valorTribAproximadoUf;

    @Column(name = "ALIQ_TRIB_APROXIMADO_MU")
    private Double aliqTribAproximadoMu;

    @Column(name = "VALOR_TRIB_APROXIMADO_MU")
    private Double valorTribAproximadoMu;

    @Column(name = "APLICAR_CEST")
    private String aplicarCest;

    @Column(name = "CLUBE_PROMOCOES_RESTANTE")
    private Double clubePromocoesRestante;

    @Column(name = "CLUBE_PROMOCOES_DESCONTO")
    private Double clubePromocoesDesconto;

    @Column(name = "CLUBE_PROMOCOES_CODPROMOCAO")
    private Long clubePromocoesCodpromocao;

    @Column(name = "ATACAREJO")
    private String atacarejo;

    @Column(name = "ATACAREJO_DESCONTO")
    private Double atacarejoDesconto;

    @Column(name = "PCO_COMPRA")
    private Double pcoCompra;   

    @Column(name = "C_AQUIS")
    private Double cAquisi;

    @Column(name = "PCO_LIQ")
    private Double pcoLiq;

    @Column(name = "PCO_REMAR")
    private Double pcoRemar;

    @Column(name = "PCO_02")
    private Double pco02;

    @Column(name = "PCO_03")
    private Double pco03;

    @Column(name = "PCO_04")
    private Double pco04;

    @Column(name = "LUCRO_BRUTO")
    private Double lucroBruto;

    @Column(name = "LUCRO_REAL")
    private Double lucroReal;

    @Column(name = "COD_TINTOMETRICO_SCE")
    private Long codTintometricoSce;

    @Column(name = "COD_TINTOMETRICO_ITEM_SCE")
    private Long codTintometricoItemSce;

    @Column(name = "COR_TINTA")
    private String corTinta;

    @Column(name = "FABRICANTE_TINTA")
    private String fabricanteTinta;

    public void NVendi2(Double quantidade, Double unitario1, Double unitario2, Double nvtotal, 
                        Double valororiginal, Double muQteMenorun, String descricao, String data, 
                        Long codvendedor, String davNumero, String davChaveMd5, Double pcoCompra, 
                        Double cAquisi, Double pcoLiq, Double pcoRemar, Double pco02, 
                        Double pco03, Double pco04, Double lucroBruto, Double lucroReal, 
                        String muUnidade, String codigoProSer, Double aliqIcms, String unidade) {
        this.quantidade = quantidade;
        this.unitario1 = unitario1;
        this.unitario2 = unitario2;
        this.nvtotal = nvtotal;
        this.valororiginal = valororiginal;
        this.muQteMenorun = muQteMenorun;
        this.muUnidade = muUnidade;
        this.codigoProSer = codigoProSer;
        this.aliqIcms = aliqIcms;
        this.unidade = unidade;
        this.descricao = descricao;
        this.data = data;
        this.codvendedor = codvendedor;
        this.davNumero = davNumero;
        // this.davChaveMd5 = davChaveMd5; //ver se pode ser null
        this.pcoCompra = pcoCompra;
        this.cAquisi = cAquisi;
        this.pcoLiq = pcoLiq;   
        this.pcoRemar = pcoRemar;
        this.pco02 = pco02;
        this.pco03 = pco03;
        this.pco04 = pco04;
        this.lucroBruto = lucroBruto;
        this.lucroReal = lucroReal;
        this.oV = "0";
        this.npdesc = 0.0;
        this.npacre = 0.0;
        this.ncomposto = "0";
        this.codcliente = 0L;
        this.coddevolucao = 0.0;
        this.ccf = "0";
        this.coo = "0";
        this.muUnidade = "UN";
        this.muItem = 0.0;
        this.muQteMenorun = 0.0;
        this.cancelado = "N";
        this.produtoServidor = "P";
        // this.cfop = "5102";    //VERIFICAAAAAR
        this.aliqIss = 0.0;
        this.unidade = "UN";
        this.valorDesconto = 0.0;
        this.valorAcrescimo = 0.0;
        this.qteCancParcial = 0.0;
        this.valorCancParcial = 0.0;
        this.valorCancAcresc = 0.0;
        this.producao = "T";
        this.qteCasasDecQte = 3.0;
        this.qteCasasDecUni = 2.0;
        this.horaImpressao = "00:00:00";
        this.percPis = 0.0;
        this.percCofins = 0.0;
        this.totalPis = 0.0;
        this.totalCofins = 0.0;
        this.totalIcms = 0.0;
        this.cst = "040";
        this.codCstcofins = 7.0;
        this.codCstpis = 7.0;
        this.ecfValoritem = 0.0;
        this.ecfDesconto = 0.0;
        this.ecfAcrescimo = 0.0;    
        this.ecfValoritemtotal = 0.0;
        this.baseCalcPis = 0.0;
        this.baseCalcCofins = 0.0;
        this.modoSelecaoTabPreco = "0";
        this.tabPreco = "PCO_REMAR";
        this.aliqTribAproximado = 0.0;
        this.valorTribAproximado = 0.0;
        this.valorIcmsSt = 0.0;
        this.situacaoTributaria = "T";
        this.prevendaNumero = 0.0;
        this.tipoDocumento = "DAV";
        this.numeroUsuario = 0L;
        this.vendaPromocao = "N";
        this.codigoPromocao = 0L;
        this.participaMapa = 1;
        this.modbc = 0.0;
        this.vbc = 0.0;
        this.predbc = 0.0;
        this.modbcst = 0.0;
        this.pmvast = 0.0;
        this.predbcst = 0.0;
        this.vbcst = 0.0;
        this.picmsst = 0.0;
        this.aliquotaCreditoSn = 0.0;
        this.valorCreditoSn = 0.0;
        this.picms = 0.0;
        this.vicms = 0.0;
        this.vicmsst = 0.0;
        this.origemCst = 0.0;
        this.codFiguraIcmsNfceDiferido = 0.0;
        this.qtdEntregue = 0.0;
        this.valorOutrasDespesas = 0.0;
        this.tcVendaTransactionCentre = "N";
        this.tcPrecoLiquidoFarmacia = 0.0;
        this.itemProjeto = "0";
        this.codigoProjeto = 0L;
        this.codAmbiente = 0L;
        this.codIdentificadorItemProjeto = 0L;
        this.orVendaOrizon = "N";
        this.vdVendaVidalink = "N";
        this.funVendaFuncional = "N";
        this.aliqTribAproximadoUf = 0.0;
        this.valorTribAproximadoUf = 0.0;
        this.aliqTribAproximadoMu = 0.0;
        this.valorTribAproximadoMu = 0.0;
        this.clubePromocoesRestante = 0.0;
        this.clubePromocoesDesconto = 0.0;
        this.clubePromocoesCodpromocao = 0L;
        this.atacarejoDesconto = 0.0;
        this.codTintometricoSce = 0L;
        this.codTintometricoItemSce = 0L;
        this.frete = 0.0;
        this.vdescontoRegraIcms = 0.0;
        this.saldoEstoqueVendaOff = 0.0;
        this.percentualDotCompras = 0.0;
        this.valorDotCompras = 0.0;
        this.qbcMono = 0.0;
        this.vicmsMono = 0.0;
        this.qbcMonoReten = 0.0;
        this.vicmsMonoReten = 0.0;
        this.qbcMonoRet = 0.0;
        this.vicmsMonoRet = 0.0;
        this.valorDescRedBase = 0.0;
        this.quantidadeRomaneio = 0.0;

    }

}
