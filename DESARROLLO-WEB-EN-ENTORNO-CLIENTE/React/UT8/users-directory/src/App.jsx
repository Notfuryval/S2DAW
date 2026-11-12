import Spinner from "./components/atoms/Spinner";
import Button from "./components/atoms/Button";
import Usercard from "./components/molecules/Usercard";
import ErrorMessage from "./components/atoms/ErrorMessage";

const testUser = {
    "id": 1,
    "name": "Leanne Graham",
    "username": "Bret",
    "email": "Sincere@april.biz",
    "address": {
      "street": "Kulas Light",
      "suite": "Apt. 556",
      "city": "Gwenborough",
      "zipcode": "92998-3874",
      "geo": {
        "lat": "-37.3159",
        "lng": "81.1496"
      }
    },
    "phone": "1-770-736-8031 x56442",
    "website": "hildegard.org",
    "company": {
      "name": "Romaguera-Crona",
      "catchPhrase": "Multi-layered client-server neural-net",
      "bs": "harness real-time e-markets"
    }
  }
function App() {
  return (
  <>
  <Spinner />
  <Button>Test button</Button>
  <ErrorMessage message="This is an error message"/>
  <Usercard user={testUser}/>
  
  </>  
  )
}
export default App;
