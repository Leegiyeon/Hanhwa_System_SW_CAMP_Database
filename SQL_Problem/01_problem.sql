-- Programmers 조건에 맞는 사용자 정보 조회하기
-- 중고 거래 게시물을 3건 이상 등록한 사용자의 사용자 ID, 닉네임, 전체주소, 전화번호를 조회

SELECT USER_ID
     , NICKNAME
     , CONCAT(CITY,' ',STREET_ADDRESS1,' ',STREET_ADDRESS2) '전체주소'
     , CONCAT(SUBSTR(TLNO,1,3),'-',SUBSTR(TLNO,4,4),'-',SUBSTR(TLNO,8,4)) '전화번호'
FROM USED_GOODS_USER
WHERE USER_ID IN (
    SELECT WRITER_ID
    FROM USED_GOODS_BOARD
    GROUP BY WRITER_ID
    HAVING COUNT(*) >=3
)
ORDER BY USER_ID DESC;