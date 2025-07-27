unit frog;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, Vcl.Imaging.pngimage, Vcl.Imaging.jpeg,
  MMSystem, Vcl.MPlayer;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Shape4: TShape;
    Shape5: TShape;
    Shape6: TShape;
    Shape7: TShape;
    Shape8: TShape;
    Shape9: TShape;
    Shape10: TShape;
    Shape11: TShape;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Shape16: TShape;
    Shape17: TShape;
    Shape18: TShape;
    Shape19: TShape;
    Shape20: TShape;
    Shape21: TShape;
    Shape22: TShape;
    carro_esq_01: TImage;
    t_carro_esq_01: TTimer;
    carro_dir_01: TImage;
    T_carro_dir_01: TTimer;
    T_carro_esq_02: TTimer;
    carro_esq_02: TImage;
    carro_esq_03: TImage;
    carro_dir_02: TImage;
    carro_dir_03: TImage;
    T_carro_esq_03: TTimer;
    t_carro_dir_02: TTimer;
    T_carro_dir_03: TTimer;
    tronco_dir_01: TImage;
    tronco_dir_02: TImage;
    tronco_dir_03: TImage;
    tronco_esq_01: TImage;
    tronco_esq_02: TImage;
    tronco_esq_03: TImage;
    T_tronco_dir_01: TTimer;
    T_tronco_dir_02: TTimer;
    T_tronco_dir_03: TTimer;
    T_tronco_esq_01: TTimer;
    T_tronco_esq_02: TTimer;
    T_tronco_esq_03: TTimer;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Timer1: TTimer;
    Image1: TImage;
    procedure pegaposicao(Key: word);
    procedure colisao(obj1,obj2:TImage);
    procedure Estado(obj1,obj2:TImage);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure t_carro_esq_01Timer(Sender: TObject);
    procedure T_carro_dir_01Timer(Sender: TObject);
    procedure T_carro_esq_02Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure T_carro_esq_03Timer(Sender: TObject);
    procedure t_carro_dir_02Timer(Sender: TObject);
    procedure T_carro_dir_03Timer(Sender: TObject);
    procedure T_tronco_dir_01Timer(Sender: TObject);
    procedure T_tronco_dir_02Timer(Sender: TObject);
    procedure T_tronco_dir_03Timer(Sender: TObject);
    procedure T_tronco_esq_01Timer(Sender: TObject);
    procedure T_tronco_esq_02Timer(Sender: TObject);
    procedure T_tronco_esq_03Timer(Sender: TObject);
    procedure Errou;
    procedure Acertou;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure desabilitatime;
    procedure HabilitaTime;
    procedure Timer1Timer(Sender: TObject);
      private
    { Private declarations }
    transitoTocando: Boolean;
    function ColisaoSimples(obj1, obj2: TImage): Boolean;
    procedure VerificaAfogamento;
    procedure TocarSomSapo;
    procedure IniciarTransito;
    procedure PararTransito;
    procedure ControlarSomPorArea;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  contaerros,
  contaacertos:integer;
  x:integer;
implementation
//
{$R *.dfm}

// FUNÇÃO PARA VERIFICAÇÃO SIMPLES DE COLISÃO
function TForm1.ColisaoSimples(obj1, obj2: TImage): Boolean;
begin
  Result := not ((obj1.Left + obj1.Width < obj2.Left) or
                 (obj1.Left > obj2.Width + obj2.Left) or
                 (obj1.top + obj1.Height < obj2.Top) or
                 (obj1.Top > obj2.Top + obj2.Height));
end;

// PROCEDIMENTO PARA VERIFICAR A ÁREA ONDE SE ENCONTRA O SAPO
procedure TForm1.ControlarSomPorArea;
begin
   // Área dos carros
  if (Image1.Top >= 200) and (Image1.Top <= 350) then
   IniciarTransito
  else
  begin
    TocarSomSapo;
    PararTransito;
  end;
end;

// PROCEDIMENTO PARA VERIFICAR AFOGAMENTO
procedure TForm1.VerificaAfogamento;
var
  estaNaAgua: Boolean;
  estaEmTronco: Boolean;
begin
  estaNaAgua := (Image1.Top >= 80) and (Image1.Top <= 100);
  if estaNaAgua then
  begin
    estaEmTronco := False;
    
    if ColisaoSimples(Image1, tronco_dir_01) or
       ColisaoSimples(Image1, tronco_dir_02) or
       ColisaoSimples(Image1, tronco_dir_03) or
       ColisaoSimples(Image1, tronco_esq_01) or
       ColisaoSimples(Image1, tronco_esq_02) or
       ColisaoSimples(Image1, tronco_esq_03) then
      estaEmTronco := True;
    
    if not estaEmTronco then
    begin
      Image1.Top := 384;
      Image1.Left := 385;
      Errou;
    end;
  end;
end;

// MÉTODO REPRODUZIR O SOM DO SAPO
procedure TForm1.TocarSomSapo;
var
  caminhoSom: string;
begin
  caminhoSom := ExtractFilePath(Application.ExeName) + 'somsapo.wav';

  if FileExists(caminhoSom) then
  begin
    PlaySound(PChar(caminhoSom), 0, SND_FILENAME or SND_ASYNC or SND_NODEFAULT);
  end;
end;

// MÉTODO REPRODUZIR O SOM DO TRÂNSITO
procedure TForm1.IniciarTransito;
var
  caminhoSom: string;
begin
  if not transitoTocando then
  begin
    caminhoSom := ExtractFilePath(Application.ExeName) + 'Transito_44k_mono.wav';

    if FileExists(caminhoSom) then
    begin
      PlaySound(PChar(caminhoSom), 0, SND_FILENAME or SND_ASYNC or SND_LOOP or SND_NODEFAULT);
      transitoTocando := True;
    end;
  end;

end;

// MÉTODO PARA PARAR O SOM DO TRÂNSITO
procedure TForm1.PararTransito;
begin
  if transitoTocando then
  begin
    PlaySound(nil, 0, SND_PURGE);
    transitoTocando := False;
  end;
end;

// MÉTODO PARA PEGAR A POSIÇÃO DO SAPO VIA SETAS
procedure TForm1.pegaposicao(Key: Word);
begin
     case Key of
          VK_UP:
          begin

              ControlarSomPorArea;
              Image1.top:=Image1.Top-5;
              if Image1.Top <=-8 then
                 Image1.Top:=-8;

              if Image1.Top= 170 then
                 Image1.BringToFront;

             if Image1.Top<=15 then
                Acertou;
             VerificaAfogamento;
          end;
          VK_DOWN:
          begin

             ControlarSomPorArea;
             Image1.top:=Image1.Top+5;
             if Image1.Top = 404 then
                Image1.Top:=384;
             VerificaAfogamento;
          end;
          VK_LEFT:
          begin

               ControlarSomPorArea;
               Image1.Left:=Image1.Left-5;
              if Image1.Left <=-17 then
                 Image1.Left:=-17;
             VerificaAfogamento;
          end;
          VK_RIGHT:
          begin

               ControlarSomPorArea;
               Image1.Left:=Image1.Left+5;
             if Image1.Left >= 856 then
                image1.Left:=856;
             VerificaAfogamento;
          end;
     end;
end;


// MÉTODO CONTROLADOR DO CARRO 01 SENTIDO ESQUERDA
procedure TForm1.t_carro_esq_01Timer(Sender: TObject);
begin
    colisao(Image1,carro_esq_01);
    carro_esq_01.Left := carro_esq_01.Left-1;
    if carro_esq_01.Left<=-55 then
    begin
         carro_esq_01.Visible:=false;
         carro_esq_01.Left:=825;
         carro_esq_01.Visible:=true;
         Application.ProcessMessages;
    end;
end;

// MÉTODO CONTROLADOR DO CARRO 02 SENTIDO ESQUERDA
procedure TForm1.T_carro_esq_02Timer(Sender: TObject);
begin
     colisao(Image1,carro_esq_02);

    carro_esq_02.Left := carro_esq_02.Left-1;
    if carro_esq_02.Left<=-55 then
    begin
         carro_esq_02.Visible:=false;
         carro_esq_02.Left:=825;
         carro_esq_02.Visible:=true;
         Application.ProcessMessages;
    end;
end;

// MÉTODO CONTROLADOR DO CARRO 03 SENTIDO ESQUERDA
procedure TForm1.T_carro_esq_03Timer(Sender: TObject);
begin
    colisao(Image1,carro_esq_03);
    carro_esq_03.Left := carro_esq_03.Left-1;
    if carro_esq_03.Left<=-55 then
    begin
         carro_esq_03.Visible:=false;
         carro_esq_03.Left:=825;
         carro_esq_03.Visible:=true;
         Application.ProcessMessages;
    end;
end;

// MÉTODO CONTROLADOR DO CARRO 01 SENTIDO DIREITA
procedure TForm1.T_carro_dir_01Timer(Sender: TObject);
begin
    colisao(Image1,carro_dir_01);
    carro_dir_01.Left := carro_dir_01.Left+1;
    if carro_dir_01.Left>=880 then
    begin
         carro_dir_01.Visible:=false;
         carro_dir_01.Left:=0;
         carro_dir_01.Visible:=true;
         Application.ProcessMessages;
    end;
end;

// MÉTODO CONTROLADOR DO CARRO 02 SENTIDO DIREITA
procedure TForm1.t_carro_dir_02Timer(Sender: TObject);
begin
    colisao(Image1,carro_dir_02);
    carro_dir_02.Left := carro_dir_02.Left+1;
    if carro_dir_02.Left>=880 then
    begin
         carro_dir_02.Visible:=false;
         carro_dir_02.Left:=0;
         carro_dir_02.Visible:=true;
         Application.ProcessMessages;
    end;
end;

// MÉTODO CONTROLADOR DO CARRO 03 SENTIDO DIREITA
procedure TForm1.T_carro_dir_03Timer(Sender: TObject);
begin
    colisao(Image1,carro_dir_03);
    carro_dir_03.Left := carro_dir_03.Left+1;
    if carro_dir_03.Left>=880 then
    begin
         carro_dir_03.Visible:=false;
         carro_dir_03.Left:=0;
         carro_dir_03.Visible:=true;
         Application.ProcessMessages;
    end;
end;

// MÉTODO CONTROLADOR DO TRONCO 01 SENTIDO DIREITA
procedure TForm1.T_tronco_dir_01Timer(Sender: TObject);
begin
    Estado(Image1,tronco_dir_01);
    VerificaAfogamento;
    tronco_dir_01.Left := tronco_dir_01.Left+1;
    if tronco_dir_01.Left>=880 then
    begin
         tronco_dir_01.Visible:=false;
         tronco_dir_01.Left:=0;
         tronco_dir_01.Visible:=true;
         Application.ProcessMessages;
    end;
end;

// MÉTODO CONTROLADOR DO TRONCO 02 SENTIDO DIREITA
procedure TForm1.T_tronco_dir_02Timer(Sender: TObject);
begin
     Estado(Image1,tronco_dir_02);
     VerificaAfogamento;
     tronco_dir_02.Left := tronco_dir_02.Left+1;
    if tronco_dir_02.Left>=880 then
    begin
         tronco_dir_02.Visible:=false;
         tronco_dir_02.Left:=0;
         tronco_dir_02.Visible:=true;
         Application.ProcessMessages;
    end;
end;

// MÉTODO CONTROLADOR DO TRONCO 03 SENTIDO DIREITA
procedure TForm1.T_tronco_dir_03Timer(Sender: TObject);
begin
    Estado(Image1,tronco_dir_03);
    VerificaAfogamento;
    tronco_dir_03.Left := tronco_dir_03.Left+1;
    if tronco_dir_03.Left>=880 then
    begin
         tronco_dir_03.Visible:=false;
         tronco_dir_03.Left:=0;
         tronco_dir_03.Visible:=true;
         Application.ProcessMessages;
    end;
end;

// MÉTODO CONTROLADOR DO TRONCO 01 SENTIDO ESQUERDA
procedure TForm1.T_tronco_esq_01Timer(Sender: TObject);
begin
    Estado(Image1,tronco_esq_01);
    VerificaAfogamento;
    tronco_esq_01.Left := tronco_esq_01.Left-1;
    if tronco_esq_01.Left<=-55 then
    begin
         tronco_esq_01.Visible:=false;
         tronco_esq_01.Left:=825;
         tronco_esq_01.Visible:=true;
         Application.ProcessMessages;
    end;
end;

// MÉTODO CONTROLADOR DO TRONCO 02 SENTIDO ESQUERDA
procedure TForm1.T_tronco_esq_02Timer(Sender: TObject);
begin
   Estado(Image1,tronco_esq_02);
   VerificaAfogamento;
   tronco_esq_02.Left := tronco_esq_02.Left-1;
    if tronco_esq_02.Left<=-55 then
    begin
         tronco_esq_02.Visible:=false;
         tronco_esq_02.Left:=825;
         tronco_esq_02.Visible:=true;
         Application.ProcessMessages;
    end;
end;

// MÉTODO CONTROLADOR DO TRONCO 03 SENTIDO ESQUERDA
procedure TForm1.T_tronco_esq_03Timer(Sender: TObject);
begin
   Estado(Image1,tronco_esq_03);
   VerificaAfogamento;
   tronco_esq_03.Left := tronco_esq_03.Left-1;
    if tronco_esq_03.Left<=-55 then
    begin
         tronco_esq_03.Visible:=false;
         tronco_esq_03.Left:=825;
         tronco_esq_03.Visible:=true;
         Application.ProcessMessages;
    end;
end;

// MÉTODO LETREIRO
procedure TForm1.Timer1Timer(Sender: TObject);
var
path,texto: string;
i:integer;
begin
    texto:='Frogger Gamer - [Ajude o nosso amigo Frogger a atravessar a pista e o rio(Atravesse 3 vezes e ganhe o jogo!)]';
    if (Length(Texto) + 1) = x then
      begin
         x:=1;
         form1.Caption:='';
      end
   else
      begin
         form1.Caption:=form1.Caption + Copy(Texto,x,1);
         x:= x + 1;
      end;
end;

// MÉTODO PARA VERIFICAR SE SE GANHOU
procedure TForm1.Acertou;
begin
contaacertos:=contaacertos+1;
     case contaacertos of
       1: begin
              Image5.Visible:=true;
              Image1.Top :=384;
              Image1.Left:=385;
          end;
       2: begin
             image6.Visible:=true;
             Image1.Top :=384;
             Image1.Left:=385;
          end;
       3: begin
           desabilitatime;
           image7.Visible:=true;
           if MessageDlg('Parabéns! Você consegiu! Deseja continuar?',mtWarning,mbYesNo,0) = mrYes then
           begin
               contaacertos:=0;
               contaerros:=0;
               image7.Visible:=false;
               image6.Visible:=false;
               image5.Visible:=false;

               image2.Visible:=true;
               image3.Visible:=true;
               image4.Visible:=true;
               Image1.Top :=384;
               Image1.Left:=385;
               HabilitaTime;
           end
           else
           begin
                desabilitatime;
                form1.Close;
           end;
          end;
     end;
end;

// MÉTODO CONTROLADOR DE COLISÃO DE CARROS
procedure TForm1.colisao(obj1,obj2:TImage);
var
resultado:Boolean;
begin
  resultado:=false;
    if (obj1.Left+obj1.Width < obj2.Left) or
       (obj1.Left>obj2.Width+obj2.Left) or
       (obj1.top+obj1.Height<obj2.Top) or
       (obj1.Top>obj2.Top+obj2.Height) then
     resultado:=false
    else
      resultado:=true;
    if resultado then
    begin
        Image1.Top :=384;
        Image1.Left:=385;
        Errou;
    end;
end;

// MÉTODO DESABILITADA TODOS OS CONTROLADORES
procedure TForm1.desabilitatime;
begin
t_carro_esq_01.Enabled:=false;
t_carro_esq_02.Enabled:=false;
t_carro_esq_03.Enabled:=false;
T_carro_dir_01.Enabled:=false;
t_carro_dir_02.Enabled:=false;
T_carro_dir_03.Enabled:=false;

T_tronco_dir_01.Enabled:=False;
T_tronco_dir_02.Enabled:=False;
T_tronco_dir_03.Enabled:=False;
T_tronco_esq_01.Enabled:=False;
T_tronco_esq_02.Enabled:=False;
T_tronco_esq_03.Enabled:=False;
end;

// MÉTODO QUE VERIFICA SE MISSÃO FALHOU
procedure TForm1.Errou;
begin
     contaerros:=contaerros+1;
     case contaerros of
       1: Image4.Visible:=false;
       2: image3.Visible:=false;
       3: begin
           desabilitatime;
           image2.Visible:=false;
           if MessageDlg('Sua missão falhou! Deseja continuar?',mtWarning,mbYesNo,0) = mrYes then
           begin
               contaerros:=0;
               contaacertos:=0;
               image7.Visible:=false;
               image6.Visible:=false;
               image5.Visible:=false;

               image2.Visible:=true;
               image3.Visible:=true;
               image4.Visible:=true;
               Image1.Top :=384;
               Image1.Left:=385;
               HabilitaTime;

           end
           else
           begin
                desabilitatime;
                form1.Close;
           end;
          end;
     end;
end;

// MÉTODO QUE VERIFICA SE O SAPO ESTA NO TRONCO E O ACOMPANHA
procedure TForm1.Estado(obj1, obj2: TImage);
var
resultado:Boolean;
begin
  resultado:=false;
    if (obj1.Left+obj1.Width < obj2.Left) or
       (obj1.Left>obj2.Width+obj2.Left) or
       (obj1.top+obj1.Height<obj2.Top) or
       (obj1.Top>obj2.Top+obj2.Height) then
     resultado:=false
    else
      resultado:=true;
    if resultado then
    begin
        Image1.Left:=obj2.Left;
    end;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  desabilitatime;
  PararTransito;
  Application.Terminate;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
    DoubleBuffered := true;
    x:=1;
    transitoTocando := False;
    // Iniciar som de trânsito quando o jogo começar
    TocarSomSapo;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   pegaposicao(key);
end;

procedure TForm1.HabilitaTime;
begin
  t_carro_esq_01.Enabled:=true;
  t_carro_esq_02.Enabled:=true;
  t_carro_esq_03.Enabled:=true;
  T_carro_dir_01.Enabled:=true;
  t_carro_dir_02.Enabled:=true;
  T_carro_dir_03.Enabled:=true;

  T_tronco_dir_01.Enabled:=true;
  T_tronco_dir_02.Enabled:=true;
  T_tronco_dir_03.Enabled:=true;
  T_tronco_esq_01.Enabled:=true;
  T_tronco_esq_02.Enabled:=true;
  T_tronco_esq_03.Enabled:=true;
end;
end.

