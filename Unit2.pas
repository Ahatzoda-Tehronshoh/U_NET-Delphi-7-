unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, Grids, DBGrids, ADODB, Buttons, ExtCtrls;

type
  TSpecForm = class(TForm)
    ADOQuery1: TADOQuery;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ADOQuery2: TADOQuery;
    Panel1: TPanel;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit1: TEdit;
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
  SpecForm: TSpecForm;
  update1: Bool;
  selectedTittle: String;
  selectedTittlePos: Integer;
  defaultColor : TColor;

implementation

uses Unit3;

{$R *.dfm}

procedure TSpecForm.Button3Click(Sender: TObject);
begin
  ADOQuery2.Close;
  ADOQuery2.SQL.Clear;
  ADOQuery2.SQL.Text := 'delete from spec where ID = '
   + DBGrid1.Columns[0].Field.AsString;
//if MessageDLG('?? ????????', MtConfirmation, [MbYes, MBNo], 0) = MRYes then
  if Messagebox(0, '?? ????????', '???? ?????????????',mb_iconquestion+mb_yesno) = idYes then
    ADOQuery2.ExecSQL;
  ADOQuery2.Close;
  ADOQuery1.Close;
  ADOQuery1.Open;
end;

procedure TSpecForm.Button2Click(Sender: TObject);
begin
  update1 := true;
  UpdateSpec.showModal;
end;

procedure TSpecForm.Button1Click(Sender: TObject);
begin
  update1 := false;
  UpdateSpec.showModal;
end;

procedure TSpecForm.FormShow(Sender: TObject);
begin
  bitBtn1.Click;

  if(selectedTittlePos <> -1) then
    DBGrid1.Columns.Items[selectedTittlePos].Title.Color := defaultColor;
  selectedTittlePos := -1;
end;


procedure TSpecForm.DBGrid1TitleClick(Column: TColumn);
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

procedure TSpecForm.BitBtn1Click(Sender: TObject);
begin
  Panel1.Visible := false;
  DBGrid1.Top := 0;
  DBGrid1.Height := 497;
  Edit1.Text := '';
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Text := 'SELECT * FROM spec;';
  ADOQuery1.Open;
end;

procedure TSpecForm.RadioButton2Click(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Text := 'SELECT * FROM spec order by ' + selectedTittle  + ' DESC;';
  ADOQuery1.Open;
  Edit1.Text := '';
end;

procedure TSpecForm.RadioButton1Click(Sender: TObject);
begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery1.SQL.Text := 'SELECT * FROM spec order by ' + selectedTittle + ';';
  ADOQuery1.Open;
  Edit1.Text := '';
end;

procedure TSpecForm.Edit1Change(Sender: TObject);
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
    ADOQuery1.SQL.Text := 'SELECT * FROM spec '
      + 'where ' + selectedTittle + ' like''%' + Edit1.Text + '%'' '
      + 'order by ' + selectedTittle + sort + ';';
    ADOQuery1.Open;
  end else if (RadioButton1.Checked) then
    RadioButton1.OnClick(RadioButton1)
  else
    RadioButton1.OnClick(RadioButton1);
end;

procedure TSpecForm.FormCreate(Sender: TObject);
begin
  defaultColor := DBGrid1.Columns.Items[0].Title.Color;
end;

end.
