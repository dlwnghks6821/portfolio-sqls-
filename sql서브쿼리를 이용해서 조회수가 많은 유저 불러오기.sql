/*��ȸ���� ���帹�� ������ ����Ʈ (���� ���� ) */
select userid,nClick from board where nClick = (select max(nClick) from board);