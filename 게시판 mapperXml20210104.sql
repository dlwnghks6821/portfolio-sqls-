<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC " -//mybatis.org//DTD Mapper 3.0//EN" 
	"http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.exhibition.project.BoardDao.BoardDao">
<!-- ��� �ޱ� -->
	<select id="contentView" resultType="com.exhibition.project.BoardDto.BoardDto">
	<!-- Ŭ���� �Խù� ��� �������� -->
	select board_num,userid,boardtopic,board_comment,rdate,nClick,bGroup,bStep,bIndent
		 from board where board_num =#{param1}
	
	
	</select>
	<!-- ��ȸ�� �������� ����  -->
	<select id="ViewDescList" resultType="com.exhibition.project.BoardDto.BoardDto">
	select board_num,userid,boardtopic,board_comment,rdate,nClick,bGroup,bStep,bIndent
		 from board order by nclick desc
	
	</select>
	<!--  ��ȸ�� �������� ���� -->
	<select id="ViewAscList" resultType="com.exhibition.project.BoardDto.BoardDto">
	select board_num,userid,boardtopic,board_comment,rdate,nClick,bGroup,bStep,bIndent
		 from board order by nclick asc
	</select>
	<!-- �ֱ� �Խù� ���� -->
	<select id="ViewDateDsc" resultType="com.exhibition.project.BoardDto.BoardDto">
		select board_num,userid,boardtopic,board_comment,rdate,nClick,bGroup,bStep,bIndent
		 from board order by rdate desc
	</select>
	<!--  ������ �Խù� ����  -->
	<select id="ViewDateAsc" resultType="com.exhibition.project.BoardDto.BoardDto">
	select board_num,userid,boardtopic,board_comment,rdate,nClick,bGroup,bStep,bIndent
		 from board order by rdate asc
	
	</select>
	
	
	<select id="memberCheck" resultType="int">
	select count(*) cnt from board where userid=#{param1}
	
	
	</select>
	<!-- ������ �˻��Ҷ� �� ������ �������� �Խù� �˻� -->
	<select id="SearchBoard" resultType="com.exhibition.project.BoardDto.BoardDto">
	select board_num,userid,boardtopic,rdate,nClick from board where boardtopic like '%' ||  #{param1} || '%' order by rdate desc


	
	</select>
	<!-- �ֱ� Ȱ�� ���ϱ� -->
	<select id="userDate" resultType="String">
	select MAX(rdate)from board where userid=#{param1}
	
	</select>
	<!-- report -->
	<select id="board_report" resultType="com.exhibition.project.BoardDto.BoardDto">
	select userid,boardtopic,board_comment from board where board_num =#{param1}
	
	</select>
	
	<insert id="try_report">
	insert into report(userid,boardtitle,board_comment,report_comment) 
	values(#{param1},#{param2},#{param3},#{param4})
	
	</insert>
	<!-- ���� ��ŷ ���ϱ� (�Խù� ��ȸ���� ���� ���� ���ϱ�==> ��������)-->
	<select id="firstRanking" resultType="String">
	select userid from board where nClick = (select max(nClick) from board)
	
	</select>
	<!-- �Խù� ��ȸ�� ������ ���� �� �Խù� ��ȸ�� ���ϱ� -->
	<select id="firstRankingNclick" resultType="String">
	select nClick from board where nClick = (select max(nClick) from board)
	
	
	</select>
	<!-- 1�� ���� ���� ����Ʈ �ҷ�����  -->
	<!-- ��ȸ���� �������� �������� ���� + ����ȸ���� �ش��ϴ� ������ �� ���� ������ �������� -->
	<select id="UserRanking" resultType="com.exhibition.project.BoardDto.BoardDto">
	select distinct(userid),board_num,nclick,rdate,boardtopic from board where nclick >=150 order by nclick desc
	
	</select>
	<!-- ������ ���ϱ� ==>�ߺ��Ǵ� ���� distinct�� �̿��ؼ� ����  -->
	<select id="UserCount" resultType="int">
	select count(distinct(userid))from board
	</select>
	
	<select id="RankingCount" resultType="String">
	select  count(*) cnt from board where userid=#{param1}
	
	</select>
	<insert id="reply">
	insert into board(board_num,userid,boardtopic,board_comment,bGroup,bStep,bIndent) 
	values(board_seq.nextval,#{param1},#{param2},#{param3},#{param4},#{param5},#{param6})
	
	</insert>
	<update id="replyShape">
		update board set bStep=bStep+1 where bGroup=#{param1} and bStep > #{param2}
	
	</update>
	
	
	<select id="list" resultType="com.exhibition.project.BoardDto.BoardDto">
	
		select board_num,userid,boardtopic,rdate,nClick,board_comment
		from board order by rdate desc 
	</select>
	
	<select id="previous" resultType="com.exhibition.project.BoardDto.BoardDto">
	
	select board_num,
        userid,
        boardtopic,
        rdate,
        nclick,
        board_comment
        from(select board_num,
        userid,
        boardtopic,
        rdate,
        nclick,
        board_comment,
        row_number()over(order by board_num desc) as rnum 
        from board
            )
            where rnum between 1 and 10 
            order by board_num desc
	</select>
	
	
	<!-- Ŭ���� �Խù� ��� �������� -->
		<select id="board_view" resultType="com.exhibition.project.BoardDto.BoardDto">
	select board_num,userid,boardtopic,rdate,nClick,board_comment,bGroup,bStep,bIndent
		 from board where board_num =#{param1}
	
	
	</select>
	 
	<select id="findUser" resultType="com.exhibition.project.BoardDto.BoardDto">
	select userid from board where userid=#{param1}
	
	
	</select>
	<select id="userCount" resultType="int">
	
		select count(*) cnt from board where userid=#{param1}
	
	</select>
	<select id="userlist" resultType="com.exhibition.project.BoardDto.BoardDto">
	
	select board_num,userid,boardtopic,rdate,nClick,board_comment
		from board where userid=#{param1}
	</select>
	
	<update id="Doboard_update">
	update board set userid=#{param2},boardtopic=#{param3},board_comment=#{param4} where board_num=#{param1}
	
	</update>
	<update id="upHit">
	
	update board set nClick=nClick+1 where board_num=#{param1}
	</update>
	
	<insert id="write">
	insert into board(board_num,boardtopic,userid,nClick,board_comment)
	values(board_seq.nextval,#{param1},#{param2},'0',#{param3})                                        
	</insert>
	<delete id="Doboard_delete">
	delete from board where board_num=#{param1}
	
	</delete>
</mapper>