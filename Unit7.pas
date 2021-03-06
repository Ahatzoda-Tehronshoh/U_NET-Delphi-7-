unit Unit7;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, DBCtrls, Spin;

type
  TSubjectUpdateForm = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Button2: TButton;
    ADOQuery1: TADOQuery;
    SpinEdit1: TSpinEdit;
    Label2: TLabel;
    Label3: TLabel;
    ADOQuery2: TADOQuery;
    ComboBox1: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SubjectUpdateForm: TSubjectUpdateForm;

implementation

uses Unit6;

{$R *.dfm}

procedure TSubjectUpdateForm.FormShow(Sender: TObject);
begin
  ComboBox1.Items.Clear;
  ComboBox1.Text := '';
  ADOQuery2.Close;
  ADOQuery2.SQL.Clear;
  ADOQuery2.SQL.Text := 'select S_Name from spec;';
  ADOQuery2.Open;
  ADOQuery2.First;
  while(not ADOQuery2.Eof) do
  begin
    ComboBox1.Items.Add(ADOQuery2.Fields[0].AsString);
    ADOQuery2.Next;
  end;

  ADOQuery2.Close;

  Edit1.Text := '';
  if (Unit6.update1) then
  begin
    Button2.Caption := '????????';
    SpinEdit1.Value := SubjectForm.DBGrid1.Columns[2].Field.AsInteger;
    ComboBox1.Text := SubjectForm.DBGrid1.Columns[1].Field.AsString;;
    Edit1.Text := SubjectForm.DBGrid1.Columns[3].Field.AsString;
  end else
  begin
    Button2.Caption := '????????';
    ComboBox1.ItemIndex := 0;
  end;
end;

procedure TSubjectUpdateForm.Button2Click(Sender: TObject);
begin
  if(Edit1.Text <> '') then
  begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    
    ADOQuery2.Close;
    ADOQuery2.SQL.Clear;
    ADOQuery2.SQL.Text := 'select ID from spec where S_Name = ''' + ComboBox1.Text + ''';';
    ADOQuery2.Open;
    ADOQuery2.First;

    if(Unit6.update1) then
    begin
    ADOQuery1.SQL.Text := 'update predmet set P_Name = '''
     + Edit1.Text +''', semester = '
     + IntToStr(SpinEdit1.Value)
     + ', spec = ' + ADOQuery2.Fields[0].AsString
      +  ' where ID = '
     + SubjectForm.DBGrid1.Columns[0].Field.AsString + ';';
    end else
    begin
    ADOQuery1.SQL.Text := 'insert into predmet(spec, semester, P_Name) value('
     + ADOQuery2.Fields[0].AsString
     + ', ' + IntToStr(SpinEdit1.Value)
     + ', ''' + Edit1.Text +''');';
    end;
    ADOQuery2.Close;
    ADOQuery1.ExecSQL;
    ADOQuery1.Close;
    SubjectForm.ADOQuery1.Close;
    SubjectForm.ADOQuery1.Open;
    SubjectUpdateForm.Close;
  end;
end;

end.
