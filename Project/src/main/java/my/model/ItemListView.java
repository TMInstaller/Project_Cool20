package my.model;

import java.util.List;

public class ItemListView {
   
   private int itemTotalCount; //전체 상품 갯수
   private int currentPageNumber; // 현재 페이지 번호
   private List<Project_Items> itemList; //한 페이지에 보여지는 상품 리스트
   private int pageTotalCount; //전체 페이지 수
   private int itemCountPerPage; //페이지당 보여줄 상품 갯수
   
   public ItemListView(int itemTotalCount, int currentPageNumber, List<Project_Items> itemList,
      int itemCountPerPage) {
   super();
   this.itemTotalCount = itemTotalCount;
   this.currentPageNumber = currentPageNumber;
   this.itemList = itemList;
   this.itemCountPerPage = itemCountPerPage;
   calculatePageTotalCount();
}


   
public int getItemTotalCount() {
	return itemTotalCount;
}



public void setItemTotalCount(int itemTotalCount) {
	this.itemTotalCount = itemTotalCount;
}



public int getCurrentPageNumber() {
	return currentPageNumber;
}



public void setCurrentPageNumber(int currentPageNumber) {
	this.currentPageNumber = currentPageNumber;
}



public List<Project_Items> getItemList() {
	return itemList;
}



public void setItemList(List<Project_Items> itemList) {
	this.itemList = itemList;
}



public int getPageTotalCount() {
	return pageTotalCount;
}



public void setPageTotalCount(int pageTotalCount) {
	this.pageTotalCount = pageTotalCount;
}



public int getItemCountPerPage() {
	return itemCountPerPage;
}



public void setItemCountPerPage(int itemCountPerPage) {
	this.itemCountPerPage = itemCountPerPage;
}

private void calculatePageTotalCount() {
    if (itemTotalCount == 0) {
       pageTotalCount = 0;
    } else {
       pageTotalCount = itemTotalCount / itemCountPerPage;
       if (itemTotalCount % itemCountPerPage > 0) {
          pageTotalCount++;
       }
    }
 }
   
}

   