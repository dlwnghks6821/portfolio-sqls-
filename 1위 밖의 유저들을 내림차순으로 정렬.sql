<!-- 1�� ���� ���� ����Ʈ �ҷ�����  -->
	<!-- ��ȸ���� �������� �������� ����  -->
	<select id="UserRanking" resultType="com.exhibition.project.BoardDto.BoardDto">
	select distinct(userid),nclick,rdate from board where nclick >=150 order by nclick desc
	
	</select>