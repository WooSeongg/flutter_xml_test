// import 'package:flutter/services.dart';
// // import 'package:flutter_html/flutter_html.dart';
// import 'package:flutter/material.dart';
// import 'package:xml/xml.dart';
//
// class TestMainPage extends StatelessWidget {
//
//   var xmlString =
//       '''
//       <scrinfo _formposition="360:740" xmlver="1" scrid="cws09" control="static,button,image" scrname="cws09">
//         <form id="form" style="position:relative;width:360px;height:740px;" taborders="btn_1">
//           <static id="stc_1" style="position:relative;left:0px;top:0px;width:100.00000%;" singleline="true" stylecolor="color:{0?RGB(255, 255, 255)};">
//             <multi_lang>
//             <![CDATA[ {"caption":{"en":"ssss","ko":"ssss","vi":"ssss"}} ]]>
//             </multi_lang>
//           </static>
//           <button id="btn_1" style="position:relative;left:12px;top:68px;width:100px;height:54px;left:0px;top:0px;width:27.77778%;text-align:center;">
//             <multi_lang>
//             <![CDATA[ {"caption":{"en":"testBtn","ko":"testBtn","vi":"testBtn"}} ]]>
//             </multi_lang>
//           </button>
//           <image id="img_1" style="position:relative;height:150px;width:100.00000%;" stylecolor="background-color:{209};border-color:{209};"/>
//         </form>
//       </scrinfo>
//       ''';
//   //aString content = rootBundle.loadString('assets/sample.txt') as String;
//
//   var htmlDom2 =
//   '''
//       <div>
//         <h1>Demo Page Start22</h1>
//         <h1>Demo Page Start</h1>
//         <h1>Demo Page Start</h1>
//         <h1>Demo Page Start</h1>
//         <h1 style='color:red'>Demo Page Start<Bird></Bird>.ddd</h1>
//         <input type="button" value="회원가입"/>
//         <ul>
//           <li>LI Tag 1</li>
//           <li>LI Tag 2</li>
//           <li>LI Tag 3</li>
//           <li>LI Tag 3</li>
//           <li>LI Tag 3</li>
//           <li>LI Tag 3</li>
//           <li>LI Tag 3</li>
//           <li>LI Tag 3</li>
//           <li>LI Tag 3</li>
//           <li>LI Tag 3</li>
//           <li>LI Tag 3</li>
//           <li>LI Tag 3</li>
//           <li>LI Tag 3</li>
//         </ul>
//         <img src="https://naverpa-phinf.pstatic.net/MjAyNDAxMDlfMTA2/MDAxNzA0NzY4MDIyMDkw.wiNCKqWkjbUJDJ4ovd0S41DYsH--UbDQDUtqGgW28WMg.-ROv_gmmQXahXtCkwBFDREJ9kI8AopAzgPDb5TTvP_0g.JPEG/PC_%EB%A6%AC%EC%96%BC%ED%81%90%EC%96%B4_%EC%8B%A0%EA%B7%9C_%EC%97%84%ED%98%9C%EB%AF%BC_20231213_%284%29_170255020079311309865018750813650_17047680220816365900973102547390.jpg" alt="Girl in a jacket">
//         <h1>Demo Page End</h1>
//
//       </div>
//       ''';
//
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//         child: Html(
//       data: htmlDom2,
//       customRender: {
//         "bird": (RenderContext context, Widget child) {
//           return Text("@🐦");
//         },
//         "input": (RenderContext context, Widget child) {
//           return TextField(
//             decoration: InputDecoration(
//                 labelText: "입력하시오", border: OutlineInputBorder()),
//           );
//         }
//       },
//       tagsList: Html.tags..addAll(["bird", "flutter", "input"]),
//     ));
//   }
// }
