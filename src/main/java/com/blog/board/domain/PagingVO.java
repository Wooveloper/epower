package com.blog.board.domain;

public class PagingVO {


    private int pageNo = 1;         //현재 페이지
    private int pageSize = 10;      //화면에 보이는 레코드 수
    private int totalCount = 0;     //전체 레코드 수 
    private int countPage = 10;     //화면에 보이는 페이지 번호 수


    public PagingVO(int totalCount, int page)
    {
        this(totalCount, page, 10, 10);
    }

    public PagingVO(int totalCount, int page, int pageSize)
    {
        this(totalCount, page, pageSize, 10);
    }

    public PagingVO(int totalCount, int pageNo, int pageSize, int countPage)
    {
        this.totalCount = totalCount > 0 ? totalCount : 0;
        this.pageNo = pageNo > 0 ? pageNo : 1;
        this.pageSize = pageSize > 0 ? pageSize : 1;
        this.countPage = countPage > 0 ? countPage : 1;
    }

       
    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }
    public int getTotalCount()
    {
        return this.totalCount;
    }
    public int getPageNo()
    {
        return this.pageNo;
    }
    public int getPageSize()
    {
        return this.pageSize;
    }
    public int getCountPage()
    {
        return this.countPage;
    }

    public int getTotalPage()
    {        
        if(this.totalCount == 0) {
            
            return 1;
        }else {
            
            if(this.totalCount % this.pageSize > 0)
            {
                return this.totalCount / this.pageSize  + 1;
            }
            
            return this.totalCount / this.pageSize;
        }           
    }

    public int getStartPage()
    {
        int sp = ((this.pageNo-1)/this.countPage) * this.countPage + 1;
        if( sp > getTotalPage() )
        {
            return getTotalPage();
        }
        return sp;
    }

    public int getEndPage()
    {
        int ep = (getStartPage() + countPage - 1);
        if(ep > getTotalPage())
        {
            return getTotalPage();
        }
        return ep;
    }

    public int getLimitStart()
    {
        return (pageNo - 1) * pageSize;
    }

    public int getStartRownum()
    {
        return getLimitStart() + 1;
    }

    public int getEndRownum()
    {
        return pageNo * pageSize;
    }

    public int getNext()
    {
        return getEndPage() + 1;
    }

    public int getPrev()
    {
        return getStartPage() - 1;
    }


    public boolean nextCheck()
    {
        return getNext() <= getTotalPage();
    }

    public boolean prevCheck()
    {
        return getPrev() > 0;
    }

}

