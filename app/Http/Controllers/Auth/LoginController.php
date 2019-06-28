<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Auth;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;

class LoginController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Login Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles authenticating users for the application and
    | redirecting them to your home screen. The controller uses a trait
    | to conveniently provide its functionality to your applications.
    |
    */

    use AuthenticatesUsers;

    /**
     * Where to redirect users after login.
     *
     * @var string
     */
    protected $redirectTo = '/altas';

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest', ['except' => 'logout']);
    }

    public function username()
    {
        return 'usuario';
    }

    public function showLoginForm()
    {
        session(['link' => url()->previous()]);
        if($user = Auth::user())
            return back();
        return view('auth.login');
    }

    protected function validateLogin(Request $request)
    {
        $this->validate($request, [
            $this->username() => 'required|string',
            'password' => 'required|string',
        ]);
    }

    public function logout(Request $request)
    {
        $this->guard()->logout();

        $request->session()->invalidate();

        return $this->loggedOut($request) ?: redirect('/login');
    }

    protected function authenticated(Request $request)
    {
        $email    = $request->input('usuario');
        $password = $request->input('password');

        if (Auth::attempt(['usuario'=>$email, 'password' =>$password]))
        {
            if (auth()->user()->pwdcgd == 0){
                $user = auth()->user()->id_usuario;
                $this->guard()->logout();
                $request->session()->invalidate();
                return redirect('pass?id='.$user);
            }
            if (session('link') && session('link') != url()->current()){
                return redirect(session('link'));
            }
            else
                return redirect()->route('altas.index');
        }
        else
        {
            session(['link_error' => session('link')]);
            $errors = [$this->username() => trans('auth.failed')];
            return redirect()->back()->withInput($request->only($this->username(), 'remember'))->withErrors($errors);
        }
    }
}
