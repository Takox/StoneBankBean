/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package stonebank.bean;

import java.io.Serializable;
import java.security.NoSuchAlgorithmException;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.inject.Named;
import javax.enterprise.context.SessionScoped;
import javax.faces.context.FacesContext;
import javax.inject.Inject;
import stonebank.ejb.TusuarioFacade;
import stonebank.entity.Trol;
import stonebank.entity.Tusuario;
import stonebank.utils.CuentaUtil;
import stonebank.utils.PassUtil;
/**
 *
 * @author Fran Gambero
 */
@Named(value = "loginBean")
@SessionScoped
public class LoginBean implements Serializable {

    @EJB
    private TusuarioFacade tusuarioFacade;

    @Inject
    private ExitoErrorBean exitoErrorBean;
    
    

    protected Tusuario usuarioLoggeado;
    protected int dniLogin;
    protected String passwordLogin = "";
    Trol rolUsuario = new Trol(1);
    Trol rolEmpleado = new Trol(2);

    public Tusuario getUsuarioLoggeado() {
        return usuarioLoggeado;
    }

    public int getDniLogin() {
        return dniLogin;
    }

    public void setUsuarioLoggeado(Tusuario usuarioLoggeado) {
        this.usuarioLoggeado = usuarioLoggeado;
    }

    public void setDniLogin(int dniLogin) {
        this.dniLogin = dniLogin;
    }

    public String getPasswordLogin() {
        return passwordLogin;
    }

    public void setPasswordLogin(String passwordLogin) {
        this.passwordLogin = passwordLogin;
    }

    public LoginBean() {

    }

    public String doLogin() throws NoSuchAlgorithmException {

        setUsuarioLoggeado(this.tusuarioFacade.find(dniLogin));

        String contrasenaHash = PassUtil.generarHash(passwordLogin);
        if (!CuentaUtil.DNIyaRegistrado(tusuarioFacade, dniLogin)) {

            exitoErrorBean.setMensajeError("Usuario o contraseña incorrecto");
            exitoErrorBean.setProximaURL("/login");
            return "/error"; //Redirige a error si no lo ha hecho antes
        }
        if (contrasenaHash.equalsIgnoreCase(usuarioLoggeado.getHashContrasena())) {
            //Comprobamos el rol del usuario
            if (usuarioLoggeado.getTrolIdtrol().equals(rolUsuario)) {

                exitoErrorBean.setMensajeExito("Login usuario correcto");
                exitoErrorBean.setProximaURL("/usuario/indexUsuario");
                return "/exito";
                //return "/usuario/indexUsuario";
            } else if (usuarioLoggeado.getTrolIdtrol().equals(rolEmpleado)) {
                exitoErrorBean.setMensajeExito("Login empleado correcto");
                exitoErrorBean.setProximaURL("/empleado/indexEmpleado");
                return "/exito";
                //return "/empleado/indexEmpleado";
            }
        }

        exitoErrorBean.setMensajeError("Error al iniciar sesión");
        exitoErrorBean.setProximaURL("/login");
        return "/error"; //Redirige a error si no lo ha hecho antes

    }

    public String doCerrarSesion() {

        FacesContext.getCurrentInstance().getExternalContext().invalidateSession();

        exitoErrorBean.setMensajeExito("Sesión cerrada con éxito");
        exitoErrorBean.setProximaURL("/login");
        return "/exito";
    }

    @PostConstruct
    public void init() {
        if (dniLogin != -1) {
            usuarioLoggeado = this.tusuarioFacade.find(dniLogin);
        }
    }

}
