cls
echo off
cls
::-
::BACKUP AUTOMATIZADO DO ERP - PROSOFT        
::DEPARTAMENTO DE TI - DUNORTE DISTRIBUIDORA       
::-                                                 
::Criado por: Álvaro Felipe                        
::Skype: alvaroflp@outlook.com                     
::WhatsApp: +55 91 9 8543 9712                    
::Site: github.com/alvaroflp                       
::-
::VARIAVEIS
set SERVICO1=promanager
set SERVICO2=ProLic
set SERVICO3=Prosoft Serviço de Integração
set SERVICO4=psqlWGE
set ORIGEM1=O:\*
set ORIGEM2=C:\SQL2014\*
set DESTINO=B:\
set LOGLOCAL=C:\backup\logbackup\2020
set LOGREDE=B:\
::ESTRUTURA
echo # -------------------------------------------------------------------- #
echo #                  PARANDO SERVIÇOS DO ERP PROSOFT.                    #
echo # -------------------------------------------------------------------- #
net stop %SERVICO1%
net stop %SERVICO2%
net stop %SERVICO3%
net stop %SERVICO4%
echo # -------------------------------------------------------------------- #
echo #              REALIZANDO BACKUP DE ARQUIVOS E DIRETORIOS              #
echo # -------------------------------------------------------------------- #
net use B: \\dc1\g$\backups\Prosoft\Full
xcopy %ORIGEM1% %DESTINO% /E /Y /C /H
xcopy %ORIGEM2% %DESTINO% /E /Y /C /H
dir /s %DESTINO% > %LOGREDE%\logbackup.txt
echo # -------------------------------------------------------------------- #
echo #          GERANDO LOG DE ARQUIVOS E/OU DIRETORIOS COPIADOS            #
echo # -------------------------------------------------------------------- #
dir /s %DESTINO% > %LOGLOCAL%\logbackup.txt
echo # -------------------------------------------------------------------- #
echo #                INICIANDO SERVIÇOS DO ERP PROSOFT.                    #
echo # -------------------------------------------------------------------- #
net start %SERVICO1%
net start %SERVICO2%
net start %SERVICO3%
net start %SERVICO4%
echo
timeout 5
