# UIStackView

* 여러개의 뷰를 한 세트로 만들어주는 역할을 하는 View

## 스택뷰 설정하기

* axis: 자식 뷰의 정렬 방향을 정합니다. (.vertical, .horizontal)
* Alignment: 자식 뷰의 Y 축 정렬을 설정합니다.
* distribution: 자식 뷰의 X 축 정렬을 설정합니다.
* spacing: view들 간의 간격설정 

## 스택뷰에 뷰 추가하기

* stackView.addArrangedSubview(UIView) 
* addSubView와 비슷하지만 addArrangedSubview 를 사용해야 자동 정렬이 가능합니다.

## 스택뷰의 자식 뷰에 접근하기

* stackView.arrangedSubview: [UIView]
* view의 배열 형태로 되어있습니다. 배열과 마찬가지로 인덱스로 접근가능합니다.
* 인덱스는 추가된 순서대로 정해집니다.

## 스택뷰 오토레이아웃

* 스택뷰의 자식 뷰들은 스택뷰에 addArrangedSubView가 되면 만약 스토리보드에서 스택뷰에 추가할시에 기존에 작업한 제약사항들이 사라지고 새롭게 스택뷰의 오토레이아웃을 잡아줘야합니다. 코드로 작업시 자식뷰들은 오토레이아웃을 잡아줄 필요가 없습니다. 
* 스택뷰의 자식뷰들의 오토레이아웃은 스택뷰가 관리하게 되고 스택뷰의 오토레이아웃만 작업하면 됩니다.