unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB;

type
  TUpdateSpec = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Button2: TButton;
    ADOQuery1: TADOQuery;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  UpdateSpec: TUpdateSpec;

implementation

uses Unit2;

{$R *.dfm}

procedure TUpdateSpec.FormShow(Sender: TObject);
begin
  Edit1.Text := '';
  if (Unit2.update1) then
  begin
    Button2.Caption := 'Изменить';
    Edit1.Text := SpecForm.DBGrid1.Columns[1].Field.AsString;
  end else
  begin
    Button2.Caption := 'Добавить';
  end;
end;

procedure TUpdateSpec.Button2Click(Sender: TObject);
begin
  if(Edit1.Text <> '') then
  begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    if(Unit2.update1) then
    begin
    ADOQuery1.SQL.Text := 'update spec set S_Name = '''
     + Edit1.Text +''' where ID = '
     + SpecForm.DBGrid1.Columns[0].Field.AsString + ';';
    end else
    begin
    ADOQuery1.SQL.Text := 'insert into spec(S_Name) value('''
     + Edit1.Text +''');';
    end;
    ADOQuery1.ExecSQL;
    SpecForm.ADOQuery1.Close;
    SpecForm.ADOQuery1.Open;
    UpdateSpec.Close;
  end;
end;

end.
