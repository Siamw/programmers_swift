# Tableview
1. Table header
2. Section 
    - section header
    - table cell **
        1. Basic : 이미지, lable
        2. Subtitle : 이미지, lable, detail lable(lable 아래에 작은 글씨)
        3. Right Detail : 이미지, lable, 오른쪽에 detail lable 
        4. Left Detail : 왼쪽, 오른쪽 중앙정렬. 주소록에서 많이 사용
        5. custom : 내가 만들어서 사용 ! 
    - section footer
3. Table footer  

- UITableView
    - UIScrollView의 서브클래스
    - 세로 방향의 스크롤
    - 많은 데이터를 전제로 효율성 극대화
    - 데이터 리스트의 틀을 제공하는 뷰 클래스  

- UITableViewCell
    - UIView의 서브클래스
    - 테이블 뷰 안에서 내용을 바꿔, 반복적으로 표시되기 위한 뷰 재사용성에 초점
    1. Background view :   cell의 배경 설정
    2. Selected Background view : 선택되었을 때 변경 될 배경
    3. Content View : 내용이 채워진다. (table cell 디자인)
    - style
        1. Static cell : 앱 실행 중 테이블뷰의 내용이 변동되지 않을 때 사용 
        2. Dynamic prototype : 앱 실행 중 셀이 변경되거나, 수정 또는 삭제 될 때 사용
        
# Static Table View
- MeetingRooms 실습

# Dynamic Table View
1. table view가 reload될 때, 자신을 뿌릴 책임을 진 data source에게 섹션의 갯수를 물어본다. (numberOfSectionsInTableView)
2. 각 섹션에 필요한 row의 갯수를 물어본다.
3. 각 row에 뿌릴 table view cell을 만들어 달라고 요청한다.
     - tableView:cellForRowAtIndexPath : index path 매개변수에 section, row 정보를 가지고 있다. 이 함수에서 뷰 오브젝트를 만들어 넘겨준다.

# Master Detail Template1,2
- MasterDetail 실습

