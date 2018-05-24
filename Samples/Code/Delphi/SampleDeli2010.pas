unit SampleDeli2010;

interface

uses
  Windows, Messages, Variants, Classes, Graphics, Controls, Forms, SysUtils, HelpIntfs,
  Dialogs, StdCtrls, Cappta_Gp_Api_Com_TLB, Mask, ExtCtrls, Spin, ComCtrls, StrUtils , ActiveX, XMLDoc, XMLIntf;

type
    TForm1 = class(TForm)
    LabelUsarMultiTef: TLabel;
    LabelQuantidadeDePagamentosMultiTef: TLabel;
    PageControlPrincipal: TPageControl;
    TabSheetPagamentoDebito: TTabSheet;
    LabelValorPagamentoDebito: TLabel;
    ButtonExecutarDebito: TButton;
    TEditValorPagamentoDebito: TMaskEdit;
    TabSheetPagamentoCredito: TTabSheet;
    LabelValorPagamentoCredito: TLabel;
    LabelPagamentoCreditoComParcelas: TLabel;
    LabelTipoParcelamentoPagamentoCredito: TLabel;
    LabelQuantidadeParcelasPagamentoCredito: TLabel;
    RadioButtonPagamentoCreditoComParcelas: TRadioButton;
    RadioButtonPagamentoCreditoSemParcelas: TRadioButton;
    ComboBoxTipoParcelamentoPagamentoCredito: TComboBox;
    FloatSpinEditQuantidadeParcelasPagamentoCredito: TSpinEdit;
    ButtonExecutarCredito: TButton;
    TEditValorPagamentoCredito: TMaskEdit;
    TabSheetPagamentoCrediario: TTabSheet;
    LabelValorPagamentoCrediario: TLabel;
    LabelQuantidadeParcelasPagamentoCrediario: TLabel;
    FloatSpinEditQuantidadeParcelasPagamentoCrediario: TSpinEdit;
    ButtonExecutarCrediario: TButton;
    TEditValorPagamentoCrediario: TMaskEdit;
    TabSheetReimpressaoCupom: TTabSheet;
    LabelNumeroControleReimpressaoCupom: TLabel;
    LabelReimprimirUltimoCupom: TLabel;
    RadioButtonReimprimirUltimoCupom: TRadioButton;
    RadioButtonNaoReimprimirUltimoCupom: TRadioButton;
    ButtonExecutarReimpressao: TButton;
    PanelViaASerImprimida: TGroupBox;
    RadioButtonReimprimirTodasVias: TRadioButton;
    RadioButtonReimprimirViaCliente: TRadioButton;
    RadioButtonReimprimirViaLoja: TRadioButton;
    TabSheetCancelamento: TTabSheet;
    LabelSenhaAdministrativaCancelamento: TLabel;
    LabelNumeroControleCancelamento: TLabel;
    EditSenhaAdministrativaCancelamento: TEdit;
    TextEditNumeroControleCancelamento: TEdit;
    ButtonExecutarCancelamento: TButton;
    TabSheet1: TTabSheet;
    LabelTipoEntradaPinpad: TLabel;
    ComboBoxTipoInformacaoPinpad: TComboBox;
    ButtonSolicitarInformacaoPinpad: TButton;
    TabSheetTicketCar: TTabSheet;
    LabelValorPagamentoTicketCar: TLabel;
    LabelNumeroSerialPagamentoTicketCar: TLabel;
    LabelNumeroDocumentoFiscalPagamentoTicketCar: TLabel;
    EditNumeroSerialTicketCar: TEdit;
    EditNumeroDocumentoFiscalTicketCar: TEdit;
    ButtonExecutarPagamentoTicketCar: TButton;
    TEditValorPagamentoTicketCar: TMaskEdit;
    RadioButtonUsarMultiTef: TRadioButton;
    RadioButtonNaoUsarMultiTef: TRadioButton;
    FloatSpinEditQuantidadeDePagamentosMultiTef: TSpinEdit;
    GroupBoxResultado: TGroupBox;
    TMemoResultado: TMemo;
    PanelExibirInterface: TPanel;
    lblConfiguracaoInterface: TLabel;
    RadioButtonInterfaceVisivel: TRadioButton;
    RadioButtonInterfaceInvisivel: TRadioButton;
    TextEditNumeroControleReimpressaoCupom: TEdit;
    function FormatarNumeroControle(numeroControle: double) : string;
    function DeveIniciarMultiCartoes() : boolean;
    function ConcatenarCupons(mensagemAprovada: string; cupom: string) : string;
    procedure IniciarMultiCartoes();
    procedure IterarOperacaoTef();
    procedure RadioButtonUsarMultiTefClick(Sender: TObject);
    function GerarMensagemTransacaoAprovada : string;
    function OperacaoNaoFinalizada(iteracaoTef: IIteracaoTef): boolean;
    function BuscarNodeXML(XMLAutenticacao: TXMLDocument; nomeNode: string) : IXMLNode;
    procedure HabilitarControlesMultiTef();
    procedure HabilitarBotoes();
    procedure DesabilitarControlesMultiTef();
    procedure DesabilitarBotoes();
    procedure RadioButtonNaoReimprimirUltimoCupomClick(Sender: TObject);
    procedure RadioButtonPagamentoCreditoComParcelasClick(Sender: TObject);
    procedure RadioButtonPagamentoCreditoSemParcelasClick(Sender: TObject);
    procedure RadioButtonReimprimirTodasViasClick(Sender: TObject);
    procedure RadioButtonReimprimirUltimoCupomClick(Sender: TObject);
    procedure RadioButtonReimprimirViaLojaClick(Sender: TObject);
    procedure RequisitarParametros(requisicaoParametros: IRequisicaoParametro);
    procedure ResolverTransacaoPendente(respostaTransacaoPendente: IRespostaTransacaoPendente);
    procedure ExibirDadosOperacaoRecusada(resposta: IRespostaOperacaoRecusada);
    procedure ExibirDadosOperacaoAprovada(resposta: IRespostaOperacaoAprovada);
    procedure ButtonExecutarDebitoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AutenticarPdv(cliente: IClienteCappta);
    procedure RadioButtonInterfaceVisivelClick(Sender: TObject);
    procedure ConfigurarModoIntegracao(exibirInterface: boolean);
    procedure RadioButtonInterfaceInvisivelClick(Sender: TObject);
    procedure RadioButtonNaoUsarMultiTefClick(Sender: TObject);
    procedure ButtonExecutarCancelamentoClick(Sender: TObject);
    procedure ButtonExecutarCrediarioClick(Sender: TObject);
    procedure ButtonExecutarCreditoClick(Sender: TObject);
    procedure ButtonExecutarPagamentoTicketCarClick(Sender: TObject);
    procedure ButtonExecutarReimpressaoClick(Sender: TObject);
    procedure ButtonSolicitarInformacaoPinpadClick(Sender: TObject);
    procedure CriarMensagemErro(mensagem: PChar);
    procedure FinalizarPagamento();
    procedure ExibirMensagem(mensagem: IMensagem);
    procedure RadioButtonReimprimirViaClienteClick(Sender: TObject);
    procedure AtualizarResultado(mensagem: string);
    procedure OnRadioButtonUsarMultiTefClick(Sender: TObject);


  private
    chaveAutenticacao: string;
    cliente: IClienteCappta;
    cnpj: string;
    pdv: Int32;
    processandoPagamento: boolean;
    quantidadeCartoes: Int32;
    sessaoMultiTefEmAndamento: boolean;
    tipoVia: Integer;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

  const
  INTERVALO_MILISEGUNDOS: Integer = 500;

implementation

{$R *.dfm}

procedure TForm1.ButtonExecutarCancelamentoClick(Sender: TObject);
var
  numeroControle: string;
  senhaAdministrativa: string;
begin
  if sessaoMultiTefEmAndamento = true then
  begin
     CriarMensagemErro('N�o � poss�vel cancelar um pagamento com uma sess�o multitef em andamento.'); exit;
  end;

  numeroControle := (TextEditNumeroControleCancelamento.Text);
  senhaAdministrativa:= EditSenhaAdministrativaCancelamento.Text;

  if Length(senhaAdministrativa) = 0 then
  begin
     CriarMensagemErro('A senha administrativa n�o pode ser vazia.');
     exit;
  end;

  cliente.CancelarPagamento(senhaAdministrativa, numeroControle);

  processandoPagamento := false;
  IterarOperacaoTef();
end;

procedure TForm1.OnRadioButtonUsarMultiTefClick(Sender: TObject);
begin
  if RadioButtonUsarMultiTef.Checked = false then exit;

  LabelQuantidadeDePagamentosMultiTef.Show();
  FloatSpinEditQuantidadeDePagamentosMultiTef.Show();
end;

procedure TForm1.ButtonExecutarCrediarioClick(Sender: TObject);
var
  detalhes: DetalhesCrediario;
  quantidadeParcelas: integer;
  valor: double;
begin
  quantidadeParcelas := Trunc(FloatSpinEditQuantidadeParcelasPagamentoCrediario.Value);
  valor := StrToFloat(TEditValorPagamentoCrediario.Text);

  detalhes := CoDetalhesCrediario.Create;
  detalhes.QuantidadeParcelas := quantidadeParcelas;

  if (DeveIniciarMultiCartoes()) then
  begin
     IniciarMultiCartoes();
  end;

  cliente.PagamentoCrediario(valor, detalhes);

  processandoPagamento := true;
  IterarOperacaoTef();
end;

procedure TForm1.ButtonExecutarCreditoClick(Sender: TObject);
var
  detalhes: DetalhesCredito;
  quantidadeParcelas: integer;
  tipoParcelamento: integer;
  transacaoParcelada: boolean;
  valor: double;
begin
  quantidadeParcelas := Trunc(FloatSpinEditQuantidadeParcelasPagamentoCredito.Value);
  tipoParcelamento := ComboBoxTipoParcelamentoPagamentoCredito.ItemIndex + 1;
  transacaoParcelada := RadioButtonPagamentoCreditoComParcelas.Checked;
  valor := StrToFloat(TEditValorPagamentoCredito.Text);

  detalhes := CoDetalhesCredito.Create;
  detalhes.QuantidadeParcelas := quantidadeParcelas;
  detalhes.TransacaoParcelada := transacaoParcelada;
  detalhes.TipoParcelamento := tipoParcelamento;

  if (DeveIniciarMultiCartoes()) then
  begin
     IniciarMultiCartoes();
  end;

  cliente.PagamentoCredito(valor, detalhes);

  processandoPagamento := true;
  IterarOperacaoTef();
end;

procedure TForm1.ButtonExecutarDebitoClick(Sender: TObject);
var
  valor: double;
  exibirInterface: boolean;
  configs: Configuracoes;
begin

  valor := StrToFloat(TEditValorPagamentoDebito.Text);

  if DeveIniciarMultiCartoes() then
  begin
     IniciarMultiCartoes();
  end;

  cliente.PagamentoDebito(valor);

  processandoPagamento := true;
  IterarOperacaoTef();
end;

procedure TForm1.ButtonExecutarPagamentoTicketCarClick(Sender: TObject);
var
   detalhesPessoaFisica: IDetalhesPagamentoTicketCarPessoaFisica;
   valor: double;
begin
     valor := StrToFloat(TEditValorPagamentoTicketCar.Text);

     detalhesPessoaFisica := CoDetalhesPagamentoTicketCarPessoaFisica.Create;
     detalhesPessoaFisica.NumeroReciboFiscal := EditNumeroDocumentoFiscalTicketCar.Text;
     detalhesPessoaFisica.NumeroSerialECF := EditNumeroSerialTicketCar.Text;

     cliente.PagamentoTicketCarPessoaFisica(valor, detalhesPessoaFisica);

     processandoPagamento := true;
     IterarOperacaoTef();
end;

procedure TForm1.ButtonExecutarReimpressaoClick(Sender: TObject);
var
  reimprimirUltimoCupom: boolean;
  numeroControle: string;
begin
  if sessaoMultiTefEmAndamento = true then
  begin
     CriarMensagemErro('N�o � poss�vel reimprimir um cupom com uma sess�o multitef em andamento.'); exit;
  end;

  reimprimirUltimoCupom := RadioButtonReimprimirUltimoCupom.Checked;

  if (reimprimirUltimoCupom) then
  begin
     cliente.ReimprimirUltimoCupom(tipoVia)
  end
  else
  begin
     numeroControle := FormatarNumeroControle(StrToInt64(TextEditNumeroControleReimpressaoCupom.Text));
       cliente.ReimprimirCupom(numeroControle, tipoVia);
  end;

   processandoPagamento := false;
  IterarOperacaoTef();
  end;

 procedure TForm1.ButtonSolicitarInformacaoPinpadClick(Sender: TObject);
var
  tipoInformacaoPinpad: integer;
  requisicaoPinpad: RequisicaoInformacaoPinpad;
  resultado: string;
begin
  tipoInformacaoPinpad := ComboBoxTipoInformacaoPinpad.ItemIndex + 1;

  requisicaoPinpad := CoRequisicaoInformacaoPinpad.Create();
  requisicaoPinpad.TipoInformacaoPinpad := tipoInformacaoPinpad;

  resultado := cliente.SolicitarInformacoesPinpad(requisicaoPinpad);

  AtualizarResultado(resultado);
end;

procedure TForm1.CriarMensagemErro(mensagem: PChar);
begin
     Application.MessageBox(mensagem, 'Erro', MB_OK);
end;

function TForm1.FormatarNumeroControle(numeroControle: double) : string;
var numeroControleTexto: string;
begin
 numeroControleTexto := FloatToStr(numeroControle);
 numeroControleTexto :=  (TextEditNumeroControleReimpressaoCupom.Text);

  Result:= numeroControleTexto;
end;

function TForm1.DeveIniciarMultiCartoes() : boolean;
begin
     Result:= (sessaoMultiTefEmAndamento = false) and RadioButtonUsarMultiTef.Checked;
end;

procedure TForm1.IniciarMultiCartoes();
begin
  quantidadeCartoes:= Trunc(FloatSpinEditQuantidadeDePagamentosMultiTef.Value);
  sessaoMultiTefEmAndamento:= true;
  cliente.IniciarMultiCartoes(quantidadeCartoes);
end;

procedure TForm1.IterarOperacaoTef();
var
  iteracaoTef: IIteracaoTef;
begin
  if RadioButtonUsarMultiTef.Enabled then DesabilitarControlesMultiTef();
  DesabilitarBotoes();

  Repeat

   iteracaoTef := cliente.IterarOperacaoTef();

    if Supports(iteracaoTef, IMensagem) then
    begin
      ExibirMensagem(iteracaoTef as IMensagem);
      Sleep(INTERVALO_MILISEGUNDOS);
   end;

    if Supports(iteracaoTef, IRequisicaoParametro) then RequisitarParametros(iteracaoTef as IRequisicaoParametro);
    if Supports(iteracaoTef, IRespostaTransacaoPendente) then ResolverTransacaoPendente(iteracaoTef as IRespostaTransacaoPendente);

    if Supports(iteracaoTef, IRespostaOperacaoRecusada) then ExibirDadosOperacaoRecusada(iteracaoTef as IRespostaOperacaoRecusada);
    if Supports(iteracaoTef, IRespostaOperacaoAprovada) then
    begin
       ExibirDadosOperacaoAprovada(iteracaoTef as IRespostaOperacaoAprovada);
       FinalizarPagamento();
    end;

    Until OperacaoNaoFinalizada(iteracaoTef) = false;

  if (sessaoMultiTefEmAndamento = false) then HabilitarControlesMultiTef();
  HabilitarBotoes();
end;

function TForm1.GerarMensagemTransacaoAprovada : string;
var
  trecho1: string;
  trecho2: string;
  mensagem: string;
begin
  trecho1 := '�o';
  trecho2 := '';
  mensagem := 'Transa�%s Aprovada%s!!! %s Clique em "OK" para confirmar a%s transa�%s e "Cancelar" para desfaz�-la%s.';

  if sessaoMultiTefEmAndamento = true then
  begin
     trecho1 := '�es';
     trecho2 := 's'
  end;

  Result := Format(mensagem, [trecho1, trecho2, sLineBreak, trecho2, trecho1, trecho2]);
end;

function TForm1.OperacaoNaoFinalizada(iteracaoTef: IIteracaoTef): boolean;

var tipoIteracao: integer;
begin
  tipoIteracao := iteracaoTef.TipoIteracao;
  Result:= (tipoIteracao <> 1) and (tipoIteracao <> 2);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  cliente := CoClienteCappta.Create;
  tipoVia := 1;
  AutenticarPdv(cliente);
  ConfigurarModoIntegracao(true);
  TMemoResultado.Text := ' ';
  LabelQuantidadeDePagamentosMultiTef.Hide();
  FloatSpinEditQuantidadeDePagamentosMultiTef.Hide();
  LabelTipoParcelamentoPagamentoCredito.Hide();
  ComboBoxTipoParcelamentoPagamentoCredito.Hide();
  LabelQuantidadeParcelasPagamentoCredito.Hide();
  FloatSpinEditQuantidadeParcelasPagamentoCredito.Hide();
  FloatSpinEditQuantidadeParcelasPagamentoCredito.Value := 1;
end;

procedure TForm1.HabilitarControlesMultiTef();
begin
  RadioButtonUsarMultiTef.Enabled:= true;
  RadioButtonNaoUsarMultiTef.Enabled:= true;
  FloatSpinEditQuantidadeDePagamentosMultiTef.Enabled:= true;
end;

procedure TForm1.HabilitarBotoes();
begin
  ButtonExecutarCancelamento.Enabled:= true;
  ButtonExecutarCrediario.Enabled:= true;
  ButtonExecutarCredito.Enabled:= true;
  ButtonExecutarDebito.Enabled:= true;
  ButtonExecutarReimpressao.Enabled:= true;
end;

procedure TForm1.DesabilitarControlesMultiTef();
begin
  RadioButtonUsarMultiTef.Enabled:= false;
  RadioButtonNaoUsarMultiTef.Enabled:= false;
  FloatSpinEditQuantidadeDePagamentosMultiTef.Enabled:= false;
end;

procedure TForm1.DesabilitarBotoes();
begin
  ButtonExecutarCancelamento.Enabled:= false;
  ButtonExecutarCrediario.Enabled:= false;
  ButtonExecutarCredito.Enabled:= false;
  ButtonExecutarDebito.Enabled:= false;
  ButtonExecutarReimpressao.Enabled:= false;
end;

procedure TForm1.RadioButtonNaoReimprimirUltimoCupomClick(Sender: TObject);
begin
  LabelNumeroControleReimpressaoCupom.Show();
  TextEditNumeroControleReimpressaoCupom.Show();
end;

procedure TForm1.RadioButtonPagamentoCreditoComParcelasClick(Sender: TObject);
begin
  LabelTipoParcelamentoPagamentoCredito.Show();
  ComboBoxTipoParcelamentoPagamentoCredito.Show();
  LabelQuantidadeParcelasPagamentoCredito.Show();
  FloatSpinEditQuantidadeParcelasPagamentoCredito.Show();
end;

procedure TForm1.RadioButtonPagamentoCreditoSemParcelasClick(Sender: TObject);
begin
  LabelTipoParcelamentoPagamentoCredito.Hide();
  ComboBoxTipoParcelamentoPagamentoCredito.Hide();
  LabelQuantidadeParcelasPagamentoCredito.Hide();
  FloatSpinEditQuantidadeParcelasPagamentoCredito.Hide();
  FloatSpinEditQuantidadeParcelasPagamentoCredito.Value := 1;
end;

procedure TForm1.RadioButtonReimprimirTodasViasClick(Sender: TObject);
begin
   tipoVia := 1;
end;

procedure TForm1.RadioButtonReimprimirUltimoCupomClick(Sender: TObject);
begin
  LabelNumeroControleReimpressaoCupom.Hide();
  TextEditNumeroControleReimpressaoCupom.Hide();
end;

procedure TForm1.RadioButtonReimprimirViaLojaClick(Sender: TObject);
begin
   tipoVia := 3;
end;

procedure TForm1.RequisitarParametros(requisicaoParametros: IRequisicaoParametro);
var
  parametro: string;
  mensagemConvertida: string;
  acao: Int32;
begin
    mensagemConvertida := AnsiToUtf8(requisicaoParametros.Mensagem);
    parametro := InputBox('Sample API COM', mensagemConvertida, '');

    if Length(parametro) = 0 then
    begin
       acao := 2;
       parametro := ' ';
    end
    else begin acao := 1; end;

    cliente.EnviarParametro(parametro, acao);
end;

procedure TForm1.ResolverTransacaoPendente(respostaTransacaoPendente: IRespostaTransacaoPendente);
var
  parametro: string;
  mensagemConvertida: string;
  acao: Int32;
  lowerBound, upperBound, contador: LongInt;
  listaTransacoes: PSafeArray;
  transacaoPendente: ITransacaoPendente;
begin
     mensagemConvertida := AnsiToUtf8(respostaTransacaoPendente.Mensagem);
     listaTransacoes := respostaTransacaoPendente.ListaTransacoesPendentes;

     SafeArrayGetLBound(listaTransacoes, 1, lowerBound);
     SafeArrayGetUBound(listaTransacoes, 1, upperBound);
     for contador := lowerBound to upperBound do
      begin
           SafeArrayGetElement(listaTransacoes, contador, transacaoPendente);
           mensagemConvertida := Concat(mensagemConvertida, sLineBreak, 'N�mero de Controle: ', transacaoPendente.numeroControle);
           mensagemConvertida := Concat(mensagemConvertida, sLineBreak, 'Bandeira: ', transacaoPendente.NomeBandeiraCartao);
           mensagemConvertida := Concat(mensagemConvertida, sLineBreak, 'Adquirente: ', transacaoPendente.NomeAdquirente);
           mensagemConvertida := Concat(mensagemConvertida, sLineBreak, 'Valor: ', FloatToStr(transacaoPendente.valor));
           mensagemConvertida := Concat(mensagemConvertida, sLineBreak, 'Data: ', DateTimeToStr(transacaoPendente.DataHoraAutorizacao));
      end;

     parametro := InputBox('Sample API COM', mensagemConvertida, '');

     if Length(parametro) = 0 then
     begin
       acao := 2;
       parametro := ' ';
     end
     else begin acao := 1; end;

    cliente.EnviarParametro(parametro, acao);
end;

procedure TForm1.ExibirDadosOperacaoRecusada(resposta: IRespostaOperacaoRecusada);
var textoCodigoAnsi: string;
begin
  textoCodigoAnsi := Utf8ToAnsi('C�digo');
  AtualizarResultado(Format('%s: %d%s%s', [textoCodigoAnsi, resposta.CodigoMotivo, sLineBreak, resposta.Motivo]))
end;

procedure TForm1.ExibirDadosOperacaoAprovada(resposta: IRespostaOperacaoAprovada);
var mensagemAprovada: string;
begin
    mensagemAprovada := ' ';

   if (resposta.CupomCliente <> null) then mensagemAprovada := Format('%s%s',[ConcatenarCupons(mensagemAprovada, resposta.CupomCliente), sLineBreak]);
   if (resposta.CupomLojista <> null) then mensagemAprovada := ConcatenarCupons(mensagemAprovada, resposta.CupomLojista);
   if (resposta.CupomReduzido <> null) then mensagemAprovada := ConcatenarCupons(mensagemAprovada, resposta.CupomReduzido);

   AtualizarResultado(mensagemAprovada);
end;

function TForm1.ConcatenarCupons(mensagemAprovada: string; cupom: string) : string;
begin
  Result:= Format('%s%s%s', [mensagemAprovada, ReplaceStr(cupom, '"', ''), sLineBreak]);
end;

procedure TForm1.AtualizarResultado(mensagem: string);
begin
  TMemoResultado.Text:= AnsiToUtf8(mensagem);
  TMemoResultado.Repaint;
end;

procedure TForm1.FinalizarPagamento();
var botaoSelecionado: Integer;
var mensagem: string;
begin
  if processandoPagamento = false then exit;
  if sessaoMultiTefEmAndamento then
  begin
     botaoSelecionado := 0;
     quantidadeCartoes:= quantidadeCartoes - 1;
     if quantidadeCartoes > 0 then exit;
  end;

  mensagem := GerarMensagemTransacaoAprovada;

  processandoPagamento := false;
  sessaoMultiTefEmAndamento := false;

  botaoSelecionado := MessageDlg(mensagem, mtConfirmation, mbOKCancel, 0);
  if botaoSelecionado = mrOK then cliente.ConfirmarPagamentos()
  else cliente.DesfazerPagamentos();

end;

procedure TForm1.ExibirMensagem(mensagem: IMensagem);
begin
  AtualizarResultado(mensagem.Descricao);
end;

procedure TForm1.RadioButtonReimprimirViaClienteClick(Sender: TObject);
begin
   tipoVia := 2;
end;

procedure TForm1.RadioButtonInterfaceInvisivelClick(Sender: TObject);
begin
  ConfigurarModoIntegracao(false);
end;

procedure TForm1.RadioButtonInterfaceVisivelClick(Sender: TObject);
begin
  ConfigurarModoIntegracao(true);
end;

procedure TForm1.RadioButtonNaoUsarMultiTefClick(Sender: TObject);
begin
  if RadioButtonNaoUsarMultiTef.Checked = false then exit;
  sessaoMultiTefEmAndamento:= false;
  LabelQuantidadeDePagamentosMultiTef.Hide();
  FloatSpinEditQuantidadeDePagamentosMultiTef.Hide();
  cliente.DesfazerPagamentos();
end;

procedure TForm1.RadioButtonUsarMultiTefClick(Sender: TObject);
begin
  if RadioButtonUsarMultiTef.Checked = false then exit;
  LabelQuantidadeDePagamentosMultiTef.Show();
  FloatSpinEditQuantidadeDePagamentosMultiTef.Show();
end;

procedure TForm1.AutenticarPdv(cliente: IClienteCappta);

var
  XMLAutenticacao: TXMLDocument;
  ChaveAutenticacaoNode: IXMLNode;
  CnpjNode: IXMLNode;
  PdvNode: IXMLNode;
  erro: string;
  resultadoAutenticacao: integer;
  valorNumericoCnpj: Int64;

 begin
  try
     XMLAutenticacao := TXMLDocument.Create(Self);
     XMLAutenticacao.LoadFromFile('autenticacao.xml');

     ChaveAutenticacaoNode :=  BuscarNodeXML(XMLAutenticacao, 'chaveAutenticacao');
     chaveAutenticacao := ChaveAutenticacaoNode.ChildNodes.First.NodeValue;

     CnpjNode := BuscarNodeXML(XMLAutenticacao, 'cnpj');
     cnpj := CnpjNode.ChildNodes.First.NodeValue;
     if Length(cnpj) <> 14 then
        raise Exception.Create('O valor passado na tag <cnpj> n�o tem 14 digitos (use um CNPJ sem pontua��o).');
     if TryStrToInt64(cnpj, valorNumericoCnpj) = false then
        raise Exception.Create('O valor passado na tag <cnpj> n�o � n�merico.');

     PdvNode := BuscarNodeXML(XMLAutenticacao, 'pdv');
     pdv := StrtoIntDef(PdvNode.ChildNodes.First.NodeValue, -1);
     if pdv = -1 then
        raise Exception.Create('O valor passado na tag <pdv> n�o � num�rico.');

     resultadoAutenticacao:= cliente.AutenticarPdv(cnpj, pdv, chaveAutenticacao);

     Case resultadoAutenticacao of
       0 : exit;
       1 : ShowMessage('N�o autorizado. Por favor, realize a autentica��o para utilizar o CapptaGpPlus.');
       2 : ShowMessage('O CapptaGpPlus esta sendo inicializado, tente novamente em alguns instantes.');
       3 : ShowMessage('O formato da requisi��o recebida pelo CapptaGpPlus � inv�lido.');
       4 : ShowMessage('Opera��o cancelada pelo operador.');
       7 : ShowMessage('Ocorreu um erro interno no CapptaGpPlus.');
       8 : ShowMessage('Ocorreu um erro na comunica��o entre a CappAPI e o CapptaGpPlus.');

     end;
     Application.Terminate;
  except on ex : Exception do
     begin
       erro := Format('%s%s%s%s%s',
            ['N�o foi poss�vel carregar o arquivo "autenticacao.xml".',
            sLineBreak,
            sLineBreak,
            'Erro: ',
            ex.Message]);
       ShowMessage(erro);
       Application.Terminate;
     end;
  end;
end;

procedure TForm1.ConfigurarModoIntegracao(exibirInterface: boolean);
var
    configs: Configuracoes;
begin
     configs := CoConfiguracoes.Create;
     configs.ExibirInterface := exibirInterface;
     cliente.Configurar(configs);
end;

function TForm1.BuscarNodeXML(XMLAutenticacao: TXMLDocument; nomeNode: string) : IXMLNode;
var
node : IXMLNode;
  begin
     node := XMLAutenticacao.DocumentElement.ChildNodes.FindNode(nomeNode);

     if node = nil then
        raise Exception.Create(Format('N�o existe a tag <%s>.', [nomeNode]));
     if node.NodeValue = ' ' then
        raise Exception.Create(Format('A tag <%s> est� sem valor definido.', [nomeNode]));

     Result := node;
  end;
end.
