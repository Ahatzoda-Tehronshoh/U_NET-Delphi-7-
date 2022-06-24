unit Unit4;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Grids, DBGrids, ADODB, ExtCtrls, Buttons;

type
  TPrepodForm = class(TForm)
    ADOQuery1: TADOQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ADOQuery2: TADOQuery;
    Panel1: TPanel;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit1: TEdit;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  PrepodForm: TPrepodForm;
  update1: Bool;
  selectedTittle: String;
  selectedTittlePos: Integer;
  defaultColor : TColor;

implementation

uses Unit5;

{$R *.dfm}

procedure TPrepodForm.Button3Click(Sender: TObject);
begin
  ADOQuery2.Close;
  ADOQuery2.SQL.Clear;
  ADOQuery2.SQL.Text := 'delete from Prepod where ID = '
   + DBGrid1.Columns[0].Field.AsString;
//if MessageDLG('Вы уверены?', MtConfirmation, [MbYes, MBNo], 0) = MRYes then
  if Messagebox(0, 'Вы уверены?', 'Окно подтверждения',mb_iconquestion+mb_yesno) = idYes then
    ADOQuery2.ExecSQL;
  ADOQuery2.Close;
  ADOQuery1.Close;
  ADOQuery1.Open;
end;

procedure TPrepodForm.Button2Click(Sender: TObject);
begin
  update1 := true;
  PrepodUpdateForm.showModal;
end;

procedure TPrepodForm.Button1Click(Sender: TObject);
begin
  update1 := false;
  PrepodUpdateForm.showModal;
end;

procedure TPrepodForm.FormShow(Sender: TObject);
begin
  bitBtn1.Click;

  if(selectedTittlePos <> -1) then
    DBGrid1.Columns.Items[selectedTittlePos].Title.Color := defaultColor;
  selectedTittlePos := -1;
end;

procedure TPrepodForm.DBGrid1TitleClick(Column: TColumn);
begin
  BitBtn1.Click;

  if(selectedTittlePos <> -1) then
    DBGrid1.Columns.Items[selectedTittlePos].Title.Color := defaultColor;
  Column.Title.Color := $FFBBAA;
  Panel1.Visible := true;
  RadioButton1.Checked := true;
  DBGrid1.Top := 72;
  DBGrid1.Height := 425;
  selectedTittle := Column.FieldName;
  selectedTittlePos := Column.Index;
  RadioButton1.OnClick(RadioButton1);
end;

procedure TPrepodForm.BitBtn1Click(Sender: TObject);
begin
  Panel1.Visible := false;
  DBGrid1.Top := 0;
  DBGrid1.Height := 497;
  Edit1.Text := '';
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Text := 'SELECT * FROM prepod;';
  ADOQuery1.Open;
end;

procedure TPrepodForm.RadioButton2Click(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Text := 'SELECT * FROM prepod order by ' + selectedTittle  + ' DESC;';
  ADOQuery1.Open;
  Edit1.Text := '';
end;

procedure TPrepodForm.RadioButton1Click(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Text := 'SELECT * FROM prepod order by ' + selectedTittle + ';';
  ADOQuery1.Open;
  Edit1.Text := '';
end;

procedure TPrepodForm.Edit1Change(Sender: TObject);
var sort : String;
begin
  if (RadioButton1.Checked) then
    sort := ''
  else
    sort := ' DESC ';

  if(Edit1.Text <> '') then
  begin
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Text := 'SELECT * FROM prepod '
      + 'where ' + selectedTittle + ' like''%' + Edit1.Text + '%'' '
      + 'order by ' + selectedTittle + sort + ';';
    ADOQuery1.Open;
  end else if (RadioButton1.Checked) then
    RadioButton1.OnClick(RadioButton1)
  else
    RadioButton1.OnClick(RadioButton1);
end;

procedure TPrepodForm.FormCreate(Sender: TObject);
begin
  defaultColor := DBGrid1.Columns.Items[0].Title.Color;
end;

end.
