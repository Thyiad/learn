class TypeEvent {
    public on = () => {
        console.log('do on')
    }
}

export default TypeEvent;


type TT = string & number;

type T1 = string | number;