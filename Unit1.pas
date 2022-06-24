unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, Grids, DBGrids, Menus;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    DataSource1: TDataSource;
    ADOQuery1: TADOQuery;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N4: TMenuItem;
    N12: TMenuItem;
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses Unit2, Unit4, Unit6, Unit8;

{$R *.dfm}

procedure TForm1.N5Click(Sender: TObject);
begin
  SpecForm.showModal;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
  PrepodForm.showModal;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
  SubjectForm.showModal;
end;

procedure TForm1.N8Click(Sender: TObject);
begin
  StudentForm.ShowModal;
end;

end.
