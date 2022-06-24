program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {SpecForm},
  Unit3 in 'Unit3.pas' {UpdateSpec},
  Unit4 in 'Unit4.pas' {PrepodForm},
  Unit5 in 'Unit5.pas' {PrepodUpdateForm},
  Unit6 in 'Unit6.pas' {SubjectForm},
  Unit7 in 'Unit7.pas' {SubjectUpdateForm},
  Unit8 in 'Unit8.pas' {StudentForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TSpecForm, SpecForm);
  Application.CreateForm(TUpdateSpec, UpdateSpec);
  Application.CreateForm(TPrepodForm, PrepodForm);
  Application.CreateForm(TPrepodUpdateForm, PrepodUpdateForm);
  Application.CreateForm(TSubjectForm, SubjectForm);
  Application.CreateForm(TSubjectUpdateForm, SubjectUpdateForm);
  Application.CreateForm(TStudentForm, StudentForm);
  Application.Run;
end.
