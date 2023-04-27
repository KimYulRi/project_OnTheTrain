/**
 * 외부 js 파일을 연결하므로 contextpath 값은 session으로 저장해뒀다 사용함.
 */
 
 var ctx = getContextPath();
  function getContextPath() {
  return sessionStorage.getItem("contextpath");
}
 
 
 $(document).ready(() => {
 
 	$("#schedulerCreate").on('click',() => {
 		location.href= ctx + "/scheduler/create"
 	});
 
 	$("#schedulerRead").on('click',() => {
 		location.href = ctx +  "/myPage/myPageMyScheduler" 
 	});
 });