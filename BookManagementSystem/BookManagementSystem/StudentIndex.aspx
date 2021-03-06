﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentIndex.aspx.cs" Inherits="StudentIndex" EnableEventValidation="false" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>学生管理</title>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1">
    <link rel="shortcut icon" href="/favicon.ico">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">

    <link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/sm.min.css">
    <link rel="stylesheet" href="//g.alicdn.com/msui/sm/0.6.2/css/sm-extend.min.css">

  </head>
  <body runat="server">
    <form runat="server">
    <div class="page-group">
        <div class="page page-current">
            <!-- 标题栏 -->
            <header class="bar bar-nav">
                <a class="icon icon-me pull-left open-panel"></a>
                <h1 class="title">功能</h1>
            </header>

            <!-- 这里是页面内容区 -->
            <div class="content">
              <div class="buttons-tab">
                <a href="#tab1" class="tab-link active button">借阅管理</a>
                <a href="#tab2" class="tab-link button">个人借阅书籍管理</a>
                <a href="#tab3" class="tab-link button">个人账单管理</a>
              </div>

                  <div class="content-block">
                    <div class="tabs">
                        <!--书籍管理页面-->
                      <div id="tab1" class="tab active">
                        <div class="content-block">
                            <!--类别下拉列表-->
                            <asp:DropDownList ID="DropDownList1" runat="server">                            
                            </asp:DropDownList>
                            <!---->
                            <asp:DropDownList ID="DropDownList2" runat="server">
                                <asp:ListItem>只显示在馆书籍</asp:ListItem>
                                <asp:ListItem>全部显示</asp:ListItem>
                            </asp:DropDownList>

                            <asp:TextBox ID="TextBox1" runat="server" placeholder="根据作者模糊查询">

                            </asp:TextBox>
                            <asp:TextBox ID="TextBox2" runat="server" placeholder="根据书籍名称模糊查询">

                            </asp:TextBox>
                            <asp:TextBox ID="TextBox3" runat="server" placeholder="根据出版社模糊查询">

                            </asp:TextBox>
                            <asp:TextBox ID="TextBox4" runat="server" placeholder="根据书籍编号精确查询">

                            </asp:TextBox>


                            <!--筛选按钮-->
                            <asp:Button ID="Button1" runat="server" Text="根据需求筛选" OnClick="FilterBooks"/>

                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" EnableModelValidation="True">
                                <Columns>
                                    <asp:TemplateField HeaderText="——书籍编号——   ">
                                         <ItemTemplate>
                                            <asp:Label ID="BookId" runat="server" Text='<%# Bind("b_id") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField >
                                    <asp:TemplateField HeaderText="——图书名称——">
                                         <ItemTemplate>
                                            <asp:Label ID="BookName" runat="server" Text='<%# Bind("b_name") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField >
                                    <asp:TemplateField HeaderText="——图书作者——">
                                         <ItemTemplate>
                                            <asp:Label ID="BookAuthor" runat="server" Text='<%# Bind("b_author") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField >
                                    <asp:TemplateField HeaderText="——图书出版社——">
                                         <ItemTemplate>
                                            <asp:Label ID="BookPress" runat="server" Text='<%# Bind("b_press") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField >
                                    <asp:TemplateField HeaderText="——库存量——">
                                         <ItemTemplate>
                                            <asp:Label ID="BookNum" runat="server" Text='<%# Bind("b_num") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField >
                                    <asp:TemplateField HeaderText="——图书类别——">
                                         <ItemTemplate>
                                            <asp:Label ID="SotrName" runat="server" Text='<%# Bind("sort_name") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField >
                                    <asp:TemplateField HeaderText="——借阅按钮——">
                                         <ItemTemplate>
                                             <asp:Button ID="Button2" runat="server" Text="借阅此书" onClick="BorrowBookClick" CommandArgument='<%#Eval("b_id") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField >
                                </Columns>
                            </asp:GridView>                          
                            <p>This is tab 2 content</p>
                        </div>
                      </div>
                      <div id="tab2" class="tab">
                        <div class="content-block">
                            <!--搜索栏-->
                            <div class="bar bar-header-secondary">
                              <div class="searchbar">
                                <a class="searchbar-cancel">取消</a>
                                <div class="search-input">
                                  <label class="icon icon-search" for="search"></label>
                                  <input type="search" id='search' placeholder='输入关键字...'/>
                                </div>
                              </div>
                            </div>
                            <br />
                            <br />
                            <div>
                                <p>未还书籍记录</p>
                                  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" EnableModelValidation="True">
                                    <Columns>
                                        <asp:TemplateField HeaderText="——学生学号——">
                                             <ItemTemplate>
                                                <asp:Label ID="StuNumBorrow" runat="server" Text='<%# Bind("st_id") %>'/>
                                            </ItemTemplate>
                                        </asp:TemplateField >
                                        <asp:TemplateField HeaderText="——学生姓名——">
                                             <ItemTemplate>
                                                <asp:Label ID="StuNameBorrow" runat="server" Text='<%# Bind("st_name") %>'/>
                                            </ItemTemplate>
                                        </asp:TemplateField >
                                        <asp:TemplateField HeaderText="——图书编号——">
                                             <ItemTemplate>
                                                <asp:Label ID="BookIdBorrow" runat="server" Text='<%# Bind("b_id") %>'/>
                                            </ItemTemplate>
                                        </asp:TemplateField >
                                        <asp:TemplateField HeaderText="——图书名称——">
                                             <ItemTemplate>
                                                <asp:Label ID="BookNameBorrow" runat="server" Text='<%# Bind("b_name") %>'/>
                                            </ItemTemplate>
                                        </asp:TemplateField >
                                        <asp:TemplateField HeaderText="——借阅时间——">
                                             <ItemTemplate>
                                                <asp:Label ID="BorrowDate" runat="server" Text='<%# Bind("borrow_date") %>'/>
                                            </ItemTemplate>
                                        </asp:TemplateField >
                                        <asp:TemplateField HeaderText="——预期归还时间——">
                                             <ItemTemplate>
                                                <asp:Label ID="WantDate" runat="server" Text='<%# Bind("want_date") %>'/>
                                            </ItemTemplate>
                                        </asp:TemplateField >
                                        <asp:TemplateField HeaderText="——归还图书——">
                                            <ItemTemplate>
                                                <asp:Button ID="Button3" runat="server" Text="还书" OnClick="ReturnBook" CommandArgument='<%#Eval("b_id") %>'/>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                  </asp:GridView>
                                <p>已还书籍记录</p>
                                <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" EnableModelValidation="True">
                                     <Columns>
                                        <asp:TemplateField HeaderText="——学生学号——">
                                             <ItemTemplate>
                                                <asp:Label ID="StuNumRecord" runat="server" Text='<%# Bind("st_id") %>'/>
                                            </ItemTemplate>
                                        </asp:TemplateField >
                                        <asp:TemplateField HeaderText="——学生姓名——">
                                             <ItemTemplate>
                                                <asp:Label ID="StuNameRecord" runat="server" Text='<%# Bind("st_name") %>'/>
                                            </ItemTemplate>
                                        </asp:TemplateField >
                                        <asp:TemplateField HeaderText="——图书编号——">
                                             <ItemTemplate>
                                                <asp:Label ID="BookIdRecord" runat="server" Text='<%# Bind("b_id") %>'/>
                                            </ItemTemplate>
                                        </asp:TemplateField >
                                        <asp:TemplateField HeaderText="——图书名称——">
                                             <ItemTemplate>
                                                <asp:Label ID="BookNameRecord" runat="server" Text='<%# Bind("b_name") %>'/>
                                            </ItemTemplate>
                                        </asp:TemplateField >
                                        <asp:TemplateField HeaderText="——借阅时间——">
                                             <ItemTemplate>
                                                <asp:Label ID="RecordDate" runat="server" Text='<%# Bind("borrow_date") %>'/>
                                            </ItemTemplate>
                                        </asp:TemplateField >
                                        <asp:TemplateField HeaderText="——实际归还时间——">
                                             <ItemTemplate>
                                                <asp:Label ID="RecordWantDate" runat="server" Text='<%# Bind("real_date") %>'/>
                                            </ItemTemplate>
                                        </asp:TemplateField >
                                    </Columns>
                                </asp:GridView>


                            </div>                          
                        </div>
                     </div>
                     <div id="tab3" class="tab">
                        <div class="content-block">
                            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" EnableModelValidation="True">
                                <Columns>
                                    <asp:TemplateField HeaderText="——学生学号——">
                                         <ItemTemplate>
                                            <asp:Label ID="StuId" runat="server" Text='<%# Bind("st_id") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField >
                                    <asp:TemplateField HeaderText="——图书名称——">
                                         <ItemTemplate>
                                            <asp:Label ID="FineBookName" runat="server" Text='<%# Bind("b_name") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField >
                                    <asp:TemplateField HeaderText="——以超期时间——">
                                         <ItemTemplate>
                                            <asp:Label ID="AllOverDate" runat="server" Text='<%# Bind("over_date") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField >
                                    <asp:TemplateField HeaderText="——欠费金额——">
                                         <ItemTemplate>
                                            <asp:Label ID="FineMoney" runat="server" Text='<%# Bind("fine") %>'/>
                                        </ItemTemplate>
                                    </asp:TemplateField >
                                 </Columns>
                            </asp:GridView>
                          <p>This is tab 2 content</p>
                        </div>
                      </div>
                    </div>
                </div>

            </div>
         </div>
    </div>
       
    <!-- popup, panel 等放在这里 -->
    <div class="panel-overlay"></div>
    <!-- Left Panel with Reveal effect -->
    <div class="panel panel-left panel-reveal">
        <div class="content-block">
<ul>
    <!-- Text inputs -->
    <li>
    <div>
        <div class="label">学号</div>
        <asp:Label ID="Label0" runat="server" Text="Label"></asp:Label>
    </div>
    </li>
    <li>
    <div>
        <div class="label">姓名</div>
        <asp:TextBox ID="TextBox6" runat="server" placeholder="Your name"></asp:TextBox>
    </div>
    </li>
    <li>
    <div>
        <div class="label">性别</div>
        <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    </div>
    </li>
    <li>
    <div>
        <div class="label">密码</div>
        <asp:TextBox ID="TextBox5" runat="server" placeholder="请输入新密码"></asp:TextBox>
    </div>
    </li>
    <li>
    <div>
        <div class="label">学院</div>
        <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
    </div>
    </li>
    <li>
    <div>
        <div class="label">班级号</div>
        <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label>
    </div>
    </li>
    <li>
    <div>
        <div class="label">信誉分</div>
        <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label>     
    </div>
    </li>
</ul>
<div class="row">
    <asp:Button ID="Button4" runat="server" Text="关闭侧栏" class="col-50 close-panel"/>
    <asp:Button ID="Button5" runat="server" Text="修改信息" class="col-50" OnClick="UpdatePersonInfo" />
</div>
        </div>
    </div>
  </form>
    <script type='text/javascript' src='//g.alicdn.com/sj/lib/zepto/zepto.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm.min.js' charset='utf-8'></script>
    <script type='text/javascript' src='//g.alicdn.com/msui/sm/0.6.2/js/sm-extend.min.js' charset='utf-8'></script>

  </body>
</html>
