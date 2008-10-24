if !exists('loaded_snippet') || &cp
    finish
endif

let st = g:snip_start_tag
let et = g:snip_end_tag

exec "Snippet begin begin<CR>".st.et."<CR>end;<CR>/"
exec "Snippet drtab drop table ".st.et.";"
exec "Snippet crtab create table ".st.et." (<CR>".st.et."<CR>)<CR>tablespace USERS pctfree 20<CR>storage (initial 10K next 10K pctincrease 0);"
exec "Snippet drseq drop sequence ".st.et.";"
exec "Snippet crseq create sequence ".st.et."<CR>start with 1;"
exec "Snippet addcon alter table\t".st.et." add<CR>constraint\t".st.et."<CR>".st.et.";"
exec "Snippet addpk alter table\t".st.et." add<CR>constraint\t".st.et."<CR>primary key (".st.et.")<CR>using index<CR>tablespace USERS pctfree 20<CR>storage (initial 10K next 10K pctincrease 0);"
exec "Snippet adduk alter table\t".st.et." add<CR>constraint\t".st.et."<CR>unique (".st.et.")<CR>using index<CR>tablespace USERS pctfree 20<CR>storage (initial 10K next 10K pctincrease 0);"
exec "Snippet addfk alter table ".st.et." add<CR>constraint\t".st.et."<CR>foreign key\t\t\t\t\t(".st.et.")<CR>references\t".st.et."\t(".st.et.");"

exec "Snippet crfun create or replace function ".st.et." (<CR>".st.et."<CR>)<CR>return ".st.et." is<CR>begin<CR>".st.et."<CR><BS>exception<CR>".st.et."<CR><BS>end ".st.et.";"
exec "Snippet fun function ".st.et." (<CR>".st.et."<CR>)<CR>return ".st.et.";"
exec "Snippet funb function ".st.et." (<CR>".st.et."<CR>)<CR>return ".st.et." is<CR>begin<CR>".st.et."<CR><BS>exception<CR>".st.et."<CR><BS>end ".st.et.";"

exec "Snippet crprc create or replace procedure ".st.et." (<CR>".st.et."<CR>)<CR>is<CR>begin<CR>".st.et."<CR><BS>exception<CR>".st.et."<CR><BS>end ".st.et.";"
exec "Snippet prc procedure ".st.et." (<CR>".st.et."<CR>);"
exec "Snippet prcb procedure ".st.et." (<CR>".st.et."<CR>)<CR>is<CR>begin<CR>".st.et."<CR><BS>exception<CR>".st.et."<CR><BS>end ".st.et.";"

exec "Snippet curb cursor ".st.et." (<CR>".st.et."<CR>)<CR>is<CR>".st.et."<CR>;"

exec "Snippet crpkg create or replace package ".st.et." as<CR>".st.et."<CR>end ".st.et.";<CR>/"
exec "Snippet crpkgb create or replace package body ".st.et." as<CR>".st.et."<CR>end ".st.et.";<CR>/"

exec "Snippet crtrg create or replace trigger ".st.et."<CR>".st.et." on ".st.et."<CR>for each row<CR>declare<CR>".st.et."<CR>begin<CR>".st.et."<CR>end;<CR>/"

exec "Snippet typetable type ".st.et." is table of ".st.et. "<CR>index by binary_integer;"
exec "Snippet typerecord type ".st.et." is record (<CR>".st.et. "<CR>);"

exec "Snippet pl SYS.DBMS_OUTPUT.put_line(".st.et.");"
exec "Snippet nl SYS.DBMS_OUTPUT.put_line(chr(9));".st.et
exec "Snippet sleep SYS.DBMS_LOCK.sleep(".st.et.");"
exec "Snippet stats execute SYS.DBMS_STATS.gather_table_stats(USER, '".st.et."');"

exec "Snippet output set serveroutput on;".st.et

" TODO
" declare: add keyword and autoindent
