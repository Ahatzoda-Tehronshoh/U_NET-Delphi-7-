unit Unit5;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls;

type
  TPrepodUpdateForm = class(TForm)
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
  PrepodUpdateForm: TPrepodUpdateForm;

implementation

uses Unit4;

{$R *.dfm}

procedure TPrepodUpdateForm.FormShow(Sender: TObject);
begin
  Edit1.Text := '';
  if (Unit4.update1) then
  begin
    Button2.Caption := 'Изменить';
    Edit1.Text := PrepodForm.DBGrid1.Columns[1].Field.AsString;
  end else
  begin
    Button2.Caption := 'Добавить';
  end;
end;

procedure TPrepodUpdateForm.Button2Click(Sender: TObject);
begin
  if(Edit1.Text <> '') then
  begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    if(Unit4.update1) then
    begin
    ADOQuery1.SQL.Text := 'update prepod set P_Name = '''
     + Edit1.Text +''' where ID = '
     + PrepodForm.DBGrid1.Columns[0].Field.AsString + ';';
    end else
    begin
    ADOQuery1.SQL.Text := 'insert into prepod(P_Name) value('''
     + Edit1.Text +''');';
    end;
    ADOQuery1.ExecSQL;
    PrepodForm.ADOQuery1.Close;
    PrepodForm.ADOQuery1.Open;
    PrepodUpdateForm.Close;
  end;
end;

end.
