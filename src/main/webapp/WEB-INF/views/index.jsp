<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<!--
   Dimension by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
   <head>
      <title>GOAT.SNPPY</title>
      <style>
      
      #header {
      	color: #ffffff;
      }
      
      a {
      	color: #ffffff;
      }
      
      a:hover {
    	color: #eaeaea; /* 밝은 회색으로 설정 */
  	  }
  	  
  	  a:visited {
     	color: #ffffff; /* 어두운 회색으로 설정 */
  	  }
  	  
  	  h2.major {
  	  	color: #ffffff;
  	  }
  	  
  	  header .use-middle li a[href="<c:url value='/logout'/>"] {
	    color: #ffffff; /* 로그아웃 링크의 색상 변경 */
	  }
	
	  header li a[href="href=#mypage"] {
	    color: #ffffff; /* 마이페이지 링크의 색상 변경 */
	  }
  	  
  	  .modal-footer .btn {
    	color: #000000 !important; /* 검정색 */
  	  }
  	  
  	  #mypage {
  	  	color: #ffffff;
  	  }
      
      #bg:after {
           -moz-transform: scale(1.125);
           -webkit-transform: scale(1.125);
           -ms-transform: scale(1.125);
           transform: scale(1.125);
           -moz-transition: -moz-transform 0.325s ease-in-out, -moz-filter 0.325s ease-in-out;
           -webkit-transition: -webkit-transform 0.325s ease-in-out, -webkit-filter 0.325s ease-in-out;
           -ms-transition: -ms-transform 0.325s ease-in-out, -ms-filter 0.325s ease-in-out;
           transition: transform 0.325s ease-in-out, filter 0.325s ease-in-out;
           background-image: url('https://project212.s3.ap-northeast-2.amazonaws.com/project/pic3+(1).png');
           background-position: center;
           background-size: cover;
           background-repeat: no-repeat;
           z-index: 1;
       }

       .login-failure {
            color: #D8000C;
            background-color: #FFD2D2;
            margin: 10px 0;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #D8000C;
         }
         
       #register {
       		margin-bottom : 20px;
       }
       
       #user_name {
       		margin-bottom : 20px;
       }
       #register-form{
       		color: #ffffff;
       }
       #imgup{
       		color: #ffffff;
       }
       #object{
       		color: #ffffff;
       }
      
      </style>
      <link rel="icon" href="https://project212.s3.ap-northeast-2.amazonaws.com/project/lungs+(1).ico" type="image/x-icon">
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link href="https://project212.s3.ap-northeast-2.amazonaws.com/project/new.css" rel="stylesheet" type="text/css">
      <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
      <noscript><link href="https://project212.s3.ap-northeast-2.amazonaws.com/project/new.css" rel="stylesheet" type="text/css"></noscript>
   
   	<!-- jQuery library -->
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

      <!-- Latest compiled and minified Bootstrap CSS -->
      <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

      <!-- Latest compiled Bootstrap JavaScript -->
      <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
   
   </head>
   <body class="is-preload">

      <!-- Wrapper -->
         <div id="wrapper">
            
            <!-- Header -->
               <header id="header">
               
                  <div class="logo">
                     <span class="fas fa-lungs" style="font-size: 30px;"></span>
                  </div>
                  <div class="content">
                     <div class="inner">
                        <h1>GOAT</h1>
                        <p>Portable X-ray for CNN-based Lesion Localization</p>
                     </div>
                  </div>
                  <nav>
                     <ul>
                        <li><a href="#intro">Intro</a></li>
                        
					    
					    <c:choose>
					      <%-- 로그인 상태가 아닐 때 --%>
					      <c:when test="${empty info}">
					      	<li><a onclick="nologin()" href="#nologin" >Upload</a></li>
					        <li id="login-status"><a href="#login">Login</a></li>
					        <li><a href="#register">Register</a></li>
					      </c:when>
					      <%-- 로그인 상태일 때 --%>
					      <c:otherwise>
					        <li><a href="#upload">Upload</a></li>
					        <li><a href="<c:url value='/logout'/>">Logout</a></li>
					        <li><a id="myPageLink" href="#mypage">MyPage</a></li>
					        
					      </c:otherwise>
					    </c:choose>
					    <!--<li><a href="#elements">Elements</a></li>-->
            			</ul>
                  </nav>
               </header>

            <!-- Main -->
               <div id="main">
               <!-- MyPage -->
                     <article id="mypage">
                        <h2 class="major">MyPage</h2>
                        <p>User ID: ${user_id} <span id="userId"></span></p>
						<p>User Full Name: ${user_name} <span id="fullName"></span></p>
						<p>Medical Code: ${medical_number} <span id="medicalCode"></span></p>
                     </article>

                  <!-- Intro -->
                     <article id="intro">
                        <h2 class="major">Intro</h2>
                        <span class="image main"><img src="https://project212.s3.ap-northeast-2.amazonaws.com/project/pic1.png">
</span>
                        <p id="object">제품설명하기!</p>
                     </article>

                  <!-- Upload -->
                     <article id="upload">
						    <h2 class="major">Upload</h2>
						    <span class="image main"><img id="uploadedImage" src='
https://project212.s3.ap-northeast-2.amazonaws.com/project/pic2.png'></span>
                     <input type="file" id="imageInput" style="display: none;" />                   
                     <button id="fileupload" onclick="openFileUpload()" style="background-color: transparent; color: white; padding: 7px 20px 26px 20px; margin: 8px 0; border: none; cursor: pointer; width: 100%;">Upload Image</button>
						   <button id="uploadButton" onclick="upLoad(); closebutten();">Upload</button>

						</article>

                  <!-- Login -->
                  <article id="nologin">
                        <h2 class="major" style="font-size: 20px;">로그인 후 사용해주세요</h2>


                            <div class="fields">
                               
                            </div>
                            
                       
                    </article>
                    
                    
                     <article id="login">
                        <h2 class="major">Login</h2>
                        <form method="post" action="/login">
                            <div class="fields">
                               <div class="field half">
                                  <label for="userid">USER ID</label>
                                  <input style="color: white;" type="text" name="user_id" id="userid" placeholder="Enter User ID" required />
                               </div>
                               <div class="field half">
                                  <label for="password">PASSWORD</label>
                                  <input style="color: white;" type="password" name="user_password" id="user_password" placeholder="Enter Password" required />
                               </div>
                            </div>
                            <ul class="actions">
                               <li><input type="submit" value="LOGIN" class="primary" /></li>
                               <li><input type="reset" value="RESET" /></li>
                            </ul>
                         </form>
                        <!-- 로그인 실패 메시지 표시 -->
                        <c:if test="${not empty error}">
                            <div class="login-failure">
                                아이디 또는 비밀번호가 틀렸습니다. 다시 시도해주세요.
                            </div>
                        </c:if>
                    </article>
                    
                  <!-- Register -->
                     <article id="register">
                        <h2 class="major">Register</h2>
                        <form method="post" action="#" id="register-form">
                           <div class="fields">
                              <div class="field">
                                 <label for="user_id">User ID</label>
                                 <input type="text" name="user_id" id="user_id" placeholder="Enter User ID" />
                              </div>
                              <div class="field">
                                 <label for="user_password">Password</label>
                                 <input type="password" name="user_password" id="user_password" placeholder="Enter Password" />
                              </div>
                              <div class="field">
                                 <label for="confirm-password">Confirm Password</label>
                                 <input type="password" name="confirm-password" id="confirm-password" placeholder="Confirm Password" />
                              </div>
                              <div class="field">
                                 <label for="medical_number">Medical Number (5 digits)</label>
                                 <input type="text" name="medical_number" id="medical_number" min=00000 max=99999 placeholder="Enter 5-digit Medical Number" />
                              </div>
                              <div class="field">
                                 <label for="user_name">Full Name</label>
                                 <input type="text" name="user_name" id="user_name" placeholder="Enter Full Name" />
                              </div>
                           </div>
                           <ul class="actions">
                              <li><input type="submit" value="Register" class="primary" /></li>
                              <li><input type="reset" value="Reset" /></li>
                           </ul>
                        </form>
                        <ul class="icons">
                           <li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
                           <li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
                           <li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
                           <li><a href="#" class="icon brands fa-github"><span class="label">GitHub</span></a></li>
                        </ul>
                     </article>

                     <script>
                     function upLoad() {
						    var formData = new FormData();
						    formData.append("image", $("#imageInput")[0].files[0]);

						    $.ajax({
						        url: "imageupload.do",
						        type: "POST",
						        data: formData,
						        contentType: false,
						        processData: false,
						        success: function (data) {
						            // 예측 결과를 이용하여 화면에 표시하거나 다른 작업 수행
						            console.log(data.uploadedImageLink);
						            console.log(data.result);
						            // #uploadedImage 요소의 src 속성을 업로드된 이미지의 URL로 변경
						            $('#uploadedImage').attr('src', data.uploadedImageLink);
						            $('#imageInput').remove();
						            // 결과를 표시
						            $('#upload').append('<p>' + data.result + '</p>');
						            $('#uploadButton').attr('id', 'next').attr('onclick', 'next').text('유사병변');
						            
						        },
						        error: function () {
						            // 오류 처리
						        }
						    });
						}
                        // 의료번호 입력 필드
                        const medicalNumberField = document.getElementById("medical-number");
                     
                        // 입력 값이 숫자인지 확인하는 함수
                        function isNumeric(value) {
                           return /^\d+$/.test(value);
                        }
                     
                        // 의료번호 필드의 입력 이벤트 처리
                        medicalNumberField.addEventListener("input", function () {
                           const inputValue = medicalNumberField.value;
                           if (!isNumeric(inputValue)) {
                              alert("의료번호는 숫자로만 입력해야 합니다.");
                              medicalNumberField.value = "";
                           }
                        });

                        function imageupload() {
                           var form = document.getElementById('register-form');
                           var formData = new FormData(form);
                           var xhr = new XMLHttpRequest();
                           xhr.open('POST', 'upload', true);
                           xhr.onload = function () {
                              if (xhr.status === 200 || xhr.status === 201) {
                                 console.log(xhr.responseText);
                              } else {
                                 console.error(xhr.responseText);
                              }
                           };
                           xhr.send(formData);
                        }
                        
                     
                     </script>

                  <!-- Elements -->
                     <article id="elements">
                        <h2 class="major">Elements</h2>

                        <section>
                           <h3 class="major">Text</h3>
                           <p>This is <b>bold</b> and this is <strong>strong</strong>. This is <i>italic</i> and this is <em>emphasized</em>.
                           This is <sup>superscript</sup> text and this is <sub>subscript</sub> text.
                           This is <u>underlined</u> and this is code: <code>for (;;) { ... }</code>. Finally, <a href="#">this is a link</a>.</p>
                           <hr />
                           <h2>Heading Level 2</h2>
                           <h3>Heading Level 3</h3>
                           <h4>Heading Level 4</h4>
                           <h5>Heading Level 5</h5>
                           <h6>Heading Level 6</h6>
                           <hr />
                           <h4>Blockquote</h4>
                           <blockquote>Fringilla nisl. Donec accumsan interdum nisi, quis tincidunt felis sagittis eget tempus euismod. Vestibulum ante ipsum primis in faucibus vestibulum. Blandit adipiscing eu felis iaculis volutpat ac adipiscing accumsan faucibus. Vestibulum ante ipsum primis in faucibus lorem ipsum dolor sit amet nullam adipiscing eu felis.</blockquote>
                           <h4>Preformatted</h4>
                           <pre><code>i = 0;

while (!deck.isInOrder()) {
    print 'Iteration ' + i;
    deck.shuffle();
    i++;
}

print 'It took ' + i + ' iterations to sort the deck.';</code></pre>
                        </section>

                        <section>
                           <h3 class="major">Lists</h3>

                           <h4>Unordered</h4>
                           <ul>
                              <li>Dolor pulvinar etiam.</li>
                              <li>Sagittis adipiscing.</li>
                              <li>Felis enim feugiat.</li>
                           </ul>

                           <h4>Alternate</h4>
                           <ul class="alt">
                              <li>Dolor pulvinar etiam.</li>
                              <li>Sagittis adipiscing.</li>
                              <li>Felis enim feugiat.</li>
                           </ul>

                           <h4>Ordered</h4>
                           <ol>
                              <li>Dolor pulvinar etiam.</li>
                              <li>Etiam vel felis viverra.</li>
                              <li>Felis enim feugiat.</li>
                              <li>Dolor pulvinar etiam.</li>
                              <li>Etiam vel felis lorem.</li>
                              <li>Felis enim et feugiat.</li>
                           </ol>
                           <h4>Icons</h4>
                           <ul class="icons">
                              <li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
                              <li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
                              <li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
                              <li><a href="#" class="icon brands fa-github"><span class="label">Github</span></a></li>
                           </ul>

                           <h4>Actions</h4>
                           <ul class="actions">
                              <li><a href="#" class="button primary">Default</a></li>
                              <li><a href="#" class="button">Default</a></li>
                           </ul>
                           <ul class="actions stacked">
                              <li><a href="#" class="button primary">Default</a></li>
                              <li><a href="#" class="button">Default</a></li>
                           </ul>
                        </section>

                        <section>
                           <h3 class="major">Table</h3>
                           <h4>Default</h4>
                           <div class="table">
                              <table>
                                 <thead>
                                    <tr>
                                       <th>Name</th>
                                       <th>Description</th>
                                       <th>Price</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <tr>
                                       <td>Item One</td>
                                       <td>Ante turpis integer aliquet porttitor.</td>
                                       <td>29.99</td>
                                    </tr>
                                    <tr>
                                       <td>Item Two</td>
                                       <td>Vis ac commodo adipiscing arcu aliquet.</td>
                                       <td>19.99</td>
                                    </tr>
                                    <tr>
                                       <td>Item Three</td>
                                       <td> Morbi faucibus arcu accumsan lorem.</td>
                                       <td>29.99</td>
                                    </tr>
                                    <tr>
                                       <td>Item Four</td>
                                       <td>Vitae integer tempus condimentum.</td>
                                       <td>19.99</td>
                                    </tr>
                                    <tr>
                                       <td>Item Five</td>
                                       <td>Ante turpis integer aliquet porttitor.</td>
                                       <td>29.99</td>
                                    </tr>
                                 </tbody>
                                 <tfoot>
                                    <tr>
                                       <td colspan="2"></td>
                                       <td>100.00</td>
                                    </tr>
                                 </tfoot>
                              </table>
                           </div>

                           <h4>Alternate</h4>
                           <div class="table-wrapper">
                              <table class="alt">
                                 <thead>
                                    <tr>
                                       <th>Name</th>
                                       <th>Description</th>
                                       <th>Price</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <tr>
                                       <td>Item One</td>
                                       <td>Ante turpis integer aliquet porttitor.</td>
                                       <td>29.99</td>
                                    </tr>
                                    <tr>
                                       <td>Item Two</td>
                                       <td>Vis ac commodo adipiscing arcu aliquet.</td>
                                       <td>19.99</td>
                                    </tr>
                                    <tr>
                                       <td>Item Three</td>
                                       <td> Morbi faucibus arcu accumsan lorem.</td>
                                       <td>29.99</td>
                                    </tr>
                                    <tr>
                                       <td>Item Four</td>
                                       <td>Vitae integer tempus condimentum.</td>
                                       <td>19.99</td>
                                    </tr>
                                    <tr>
                                       <td>Item Five</td>
                                       <td>Ante turpis integer aliquet porttitor.</td>
                                       <td>29.99</td>
                                    </tr>
                                 </tbody>
                                 <tfoot>
                                    <tr>
                                       <td colspan="2"></td>
                                       <td>100.00</td>
                                    </tr>
                                 </tfoot>
                              </table>
                           </div>
                        </section>

                        <section>
                           <h3 class="major">Buttons</h3>
                           <ul class="actions">
                              <li><a href="#" class="button primary">Primary</a></li>
                              <li><a href="#" class="button">Default</a></li>
                           </ul>
                           <ul class="actions">
                              <li><a href="#" class="button">Default</a></li>
                              <li><a href="#" class="button small">Small</a></li>
                           </ul>
                           <ul class="actions">
                              <li><a href="#" class="button primary icon solid fa-download">Icon</a></li>
                              <li><a href="#" class="button icon solid fa-download">Icon</a></li>
                           </ul>
                           <ul class="actions">
                              <li><span class="button primary disabled">Disabled</span></li>
                              <li><span class="button disabled">Disabled</span></li>
                           </ul>
                        </section>

                        <section>
                           <h3 class="major">Form</h3>
                           <form method="post" action="#">
                              <div class="fields">
                                 <div class="field half">
                                    <label for="demo-name">Name</label>
                                    <input type="text" name="demo-name" id="demo-name" value="" placeholder="Jane Doe" />
                                 </div>
                                 <div class="field half">
                                    <label for="demo-email">Email</label>
                                    <input type="email" name="demo-email" id="demo-email" value="" placeholder="jane@untitled.tld" />
                                 </div>
                                 <div class="field">
                                    <label for="demo-category">Category</label>
                                    <select name="demo-category" id="demo-category">
                                       <option value="">-</option>
                                       <option value="1">Manufacturing</option>
                                       <option value="1">Shipping</option>
                                       <option value="1">Administration</option>
                                       <option value="1">Human Resources</option>
                                    </select>
                                 </div>
                                 <div class="field half">
                                    <input type="radio" id="demo-priority-low" name="demo-priority" checked>
                                    <label for="demo-priority-low">Low</label>
                                 </div>
                                 <div class="field half">
                                    <input type="radio" id="demo-priority-high" name="demo-priority">
                                    <label for="demo-priority-high">High</label>
                                 </div>
                                 <div class="field half">
                                    <input type="checkbox" id="demo-copy" name="demo-copy">
                                    <label for="demo-copy">Email me a copy</label>
                                 </div>
                                 <div class="field half">
                                    <input type="checkbox" id="demo-human" name="demo-human" checked>
                                    <label for="demo-human">Not a robot</label>
                                 </div>
                                 <div class="field">
                                    <label for="demo-message">Message</label>
                                    <textarea name="demo-message" id="demo-message" placeholder="Enter your message" rows="6"></textarea>
                                 </div>
                              </div>
                              <ul class="actions">
                                 <li><input type="submit" value="Send Message" class="primary" /></li>
                                 <li><input type="reset" value="Reset" /></li>
                              </ul>
                           </form>
                        </section>

                     </article>

               </div>

            <!-- Footer -->
               <footer id="footer">
                  <p class="copyright">&copy; Together: <a href='https://html5up.net' />">GOAT</a>.</p>
               </footer>

         </div>






      <!-- BG -->
         <div id="bg"></div>



	<!-- 로그인 성공 실패 관련 모달창 (팝업) -->
<!-- Modal -->
<div class="modal fade" id="myModala" role="dialog">
   <div class="modal-dialog">
       <!-- Modal content-->
       <div class="modal-content">
           <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h4 class="modal-title">${mTitle}</h4>
           </div>
           <div class="modal-body">
               <p>${mMsg}</p>
           </div>
           <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
           </div>
       </div>
   </div>
</div>

<div id="uploadModal" class="modal fade" role="dialog">
   <div class="modal-dialog">
       <!-- Modal content-->
       <div class="modal-content">
           <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal">&times;</button>
               <h4 class="modal-title">Modal Header</h4>
           </div>
           <div class="modal-body">
               <p>파일 선택이 완료되었습니다.</p>
               <p>업로드 버튼을 눌러주세요.</p>
           </div>
           <div class="modal-footer">
               <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
           </div>
       </div>
   </div>
</div>
      
    <!-- 모달 영역 -->
<!-- Modal -->



    <script type="text/javascript">
      $(document).ready(function() {
          var mTitleNotEmpty = <c:out value="${not empty mTitle}"/>;
  
          if(mTitleNotEmpty){
              $("#myModala").modal("show");
          }
      });
		
		$(document).ready(function() {
		    $("#myPageLink").click(function() {
		        mypage();
		    });
		});
		
		function mypage() {
		    $.ajax({
		        url: "mypage",
		        method: "GET",
		        dataType: "json",
		        success: function (data) {
		            var user_id = data.user_id;
		            var user_name = data.user_name;
		            var medical_number = data.medical_number;

		            $("#userId").text(user_id);
		            $("#fullName").text(user_name);
		            $("#medicalCode").text(medical_number);
		        },
		        error: function (xhr, status, error) {
		            console.error("에러:", error);
		            // 에러 처리 로직을 추가할 수 있음
		        }
		    });
		}
		function openFileUpload() {
         document.getElementById('imageInput').click();
            }

            document.addEventListener('DOMContentLoaded', (event) => {
            document.getElementById('imageInput').addEventListener('change', function() {
               if (this.files.length) {
                     $('#uploadModal').modal('show');
               }
            });
         });
      function closebutten(){
         document.getElementById('fileupload').style.display = "none";
         }

        // nologin() 함수에서 모달 열기
        
	
	</script>







      <!-- Scripts -->
         <!--  <script src="https://project212.s3.ap-northeast-2.amazonaws.com/project/js/jquery.min.js"></script>  -->
         <script src="https://project212.s3.ap-northeast-2.amazonaws.com/project/js/browser.min.js"></script>
         <script src="https://project212.s3.ap-northeast-2.amazonaws.com/project/js/breakpoints.min.js"></script>
         <script src="https://project212.s3.ap-northeast-2.amazonaws.com/project/js/util.js"></script>
         <script src="https://project212.s3.ap-northeast-2.amazonaws.com/project/js/main.js"></script>
         
         
         
         


   </body>
</html>

